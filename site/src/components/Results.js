import React, { useEffect, useState } from 'react'
import { DataGrid, GridToolbarExport, GridToolbarContainer } from '@material-ui/data-grid';
import Snackbar from '@material-ui/core/Snackbar';
import MuiAlert from '@material-ui/lab/Alert';
import Tooltip from '@material-ui/core/Tooltip';
import axios from "axios";
import { useSelector } from "react-redux";
import { selectMajor, selectUniversity } from "../utils/data";
import ListIcon from '@material-ui/icons/List';
import InfoIcon from '@material-ui/icons/Info';
import {Button} from "@material-ui/core";

function Results() {
   const [loading, setLoading] = useState(true);
   const [loadingRes, setLoadingRes] = useState(true);
   const [fetchStatus, setFetchStatus] = useState(false);
   const [filterStatus, setFilterStatus] = useState(false);
   const selectedU = useSelector(selectUniversity);
   const selectedM = useSelector(selectMajor);

   const [filterU, setFilterU] = useState([]);
   const [filterM, setFilterM] = useState([]);
   const [filteredResults, setFilteredResults] = useState([]);

   const [uni, setUni] = useState([]);
   const [majors, setMajors] = useState([]);
   const [majorTypes, setMajorsTypes] = useState([]);

   const [info, setInfo] = useState(false);
   const [message, setMessage] = useState(false);
   
   const handleClose = (event) => {
      setInfo(false);
    };

    const handleClick = (uniInfo) => {
      setInfo(true);
      setMessage(uniInfo)
    };

   useEffect(() => {
      const getData = async () => {
         await fetch("universities")
         .then(res => res.json())
         .then((uni) => (
            setUni(
               uni.map((uni) => ({
                  id: uni.Uni_ID,
                  university: uni.Uni_Name,
                  info: uni.Uni_Info
               }))
            )
         ))
         .then(() =>
            fetch("majors/types")
            .then(res => res.json())
            .then((type) => (
               setMajorsTypes(
                  type.map((type) => ({
                     id: type.Name_ID,
                     major: type.Major_Name
                  }))
               )
            ))
            .then(() => {setFetchStatus(true)})
         ); 
      }
      getData();
   }, [])

   function search(indexer, indexed, type, returnHook ){
      var results = [];
      // console.log(indexer)
      for(var selection = 0; selection < indexer.length; selection++){
         for(var filter = 0; filter < indexed.length; filter++){
            if(indexed[filter][type].toLowerCase() === indexer[selection].toLowerCase()) {
               results.push({
                  [type]: indexed[filter][type],
                  info: indexed[filter].info,
                  id: indexed[filter].id
               });
               // console.log(indexed[filter].university, indexer[selection]);
            }
            else{
               // console.log("nothing");
            }
         }
      }
      if(results.length !== 0){
         setLoading(false);
         switch(type){
            case "university":
               returnHook(
                  results.map((res, index) => ({
                     id: res.id,
                     university: res.university,
                     info: res.info
                  }))
               );
               // console.log(results[0].id)
               break;
            case "major":
               returnHook(
                  results.map((res, index) => ({
                     id: res.id,
                     major: res.major,
                  }))
               );
               break;

            default:
               return null
         }
         // console.log(results)
         console.log("loading done " + type)
      }
      else{
         setLoading(false);
      }
   }

   /* function combine(parent, child, setFilter){
      var result = [];
      var result2 = [];
      for(var item = 0; item < parent.length; item++){
         // for(var index = 0; index < child.length; index++){
            var major = child.map((major) => ({
               ...major
            }))
            result[item] = {
               ...parent[item],
               major: [...major]
            }
            // console.log(result[item])
         // }
      }
      for(var item2 = 0; item2 < result.length; item2++){
         console.log(result[item2].major)
         for(var index = 0; index < result[item2].major.length; index++){
            result2[index] = {
               ...parent[item2],
               major: result[item2].major[index]
            }
            console.log(result2[index] + "item 2")
         }
      }
      setFilter(result);
      // console.log(filteredResults)
      return result;
   } */

   function filter(){
      search(selectedU.universities, uni, "university", setFilterU);
      search(selectedM.majors, majorTypes, "major", setFilterM); 
   }

   useEffect(() => {
      if(fetchStatus){
         filter()
         setFilterStatus(true);
      }
   }, [fetchStatus])

   useEffect(() => {
      if(filterStatus){
         /* // setFilteredResults(...combine(filterU, filterM, setFilteredResults));
         combine(filterU, filterM, setFilteredResults)
         // console.log(filterU) */
         axios.get("http://localhost:3001/post?uni=["+filterU.map((uni) => uni.id)+"]&major=["+filterM.map((major) => major.id)+"]")
         .then(res => {
            // console.log(res.data)
            setFilteredResults(res.data);
            setLoadingRes(false);
         })
         .catch(err => console.log(err))
      }
   }, [filterStatus])

   const columns = [
      { 
         field: 'Uni_Name', 
         headerName: 'University', 
         // flex: 0.6,
         width: 300,
         // resizable: true,
         renderCell: (params) => (
            <div style={{display:"flex", flexFlow:"row", justifyContent:"space-between", alignItems:"center", flex: 1}}>
               {params.value}
               <Tooltip title={ filteredResults[params.getValue(params.id, 'id') - 1 ].Uni_Info }>
                  <Button className="infoButton"
                     variant="outlined"
                     color="primary"
                     size="small"
                     style={{ width:"1rem", minWidth:"1rem", border:"none", padding:"0", display:"flex"}}
                     onClick={() => handleClick(filteredResults[params.getValue(params.id, 'id') - 1 ].Uni_Info)}
                  >
                     <InfoIcon fontSize="small" style={{color:"rgba(0, 206, 221)"}}/>
                  </Button>
               </Tooltip>
            </div>
          ),
      },
      { field: 'Major_Name', headerName: 'Major', width: 200},
      { field: 'Admission_Avg', headerName: 'Admission Average', width: 200 },
      // { field: 'courses', headerName: 'Required Courses', width: 200 },
      { field: 'Extra_Info', headerName: 'Info', width: 1000 },
   ]

   return !loading ? (
      <div className="content__results">
         <h2>Results</h2>
         {selectedU.universities.length === filterU.length ? null : <p>Some universities you have searched were not included in the results as they were not found on our database.</p>}
         {selectedU ? 
            !loadingRes ? 
            <div className="results__table">
               {/* <img className="loadLogo" src={process.env.PUBLIC_URL+ "/Logo1.svg"} alt="loading"/> */}
               <DataGrid rows={filteredResults} columns={columns} 
               components={{
                  Toolbar: Export
               }}
               />
            </div>  
            : <img className="loadLogo" src={process.env.PUBLIC_URL+ "/Logo1.svg"} alt="loading"/>
         : <p>you haven't selected any universities!</p>}
         <Snackbar open={info} autoHideDuration={6000} onClose={handleClose}>
            <Alert onClose={handleClose} severity="info">
               {message}
            </Alert>
         </Snackbar>
      </div>
   )
   : (
      <div> loading </div>
   )
}

const Export = () => {
   return(
      <GridToolbarContainer>
        
         <GridToolbarExport />
         <ListIcon className="results"/>
      </GridToolbarContainer>
   )
}

function Alert(props) {
   return <MuiAlert elevation={6} variant="filled" color="info" {...props} />;
 }

export default Results
