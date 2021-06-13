import React, { useEffect, useState } from 'react'
import { DataGrid } from '@material-ui/data-grid';
import { useSelector } from "react-redux";
import { selectMajor, selectUniversity } from "../utils/data";

function Results() {
   const [loading, setLoading] = useState(true);
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
            // .then(() => console.log(filterU))
         )
         
      }
      getData();
   }, [])

   function search(indexer, indexed, type, returnHook ){
      var results = [];
      console.log(indexer)
      for(var selection = 0; selection < indexer.length; selection++){
         for(var filter = 0; filter < indexed.length; filter++){
            if(indexed[filter][type].toLowerCase() === indexer[selection].toLowerCase()) {
               results.push({
                  [type]: indexed[filter][type],
                  info: indexed[filter].info
               });
               // console.log(indexed[filter].university, indexer[selection]);
            }
            else{
               console.log("nothing");
            }
         }
      }
      if(results.length !== 0){
         setLoading(false);
         switch(type){
            case "university":
               returnHook(
                  results.map((res, index) => ({
                     id: index,
                     university: res.university,
                     info: res.info
                  }))
               );
               break;
            case "major":
               returnHook(
                  results.map((res, index) => ({
                     id: index,
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

   function combine(parent, child, setFilter){
      var result = [];
      for(var item = 0; item < parent.length; item++){
         for(var index = 0; index < child.length; index++){
            result[item] = {
               ...parent[item],
               major: child[index].major
            }
            console.log(result[item])
         }
      }
      setFilter(result);
      // console.log(filteredResults)
      return result;
   }

   function filter(){
      console.log(selectedU.universities)
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
         // setFilteredResults(...combine(filterU, filterM, setFilteredResults));
         combine(filterU, filterM, setFilteredResults)
         // console.log(filterU)
      }
   }, [filterStatus])

   const columns = [
      { field: 'university', headerName: 'University', width: 200 },
      { field: 'major', headerName: 'Major', width: 200 },
      { field: 'avg', headerName: 'Admission Average', width: 200 },
      { field: 'courses', headerName: 'Required Courses', width: 200 },
      { field: 'info', headerName: 'Info', width: 200 },
   ]

   return !loading ? (
      <div className="content__results">
         <h2>Results</h2>
         {selectedU.universities.length === filterU.length ? null : <p>Some universities you have searched were not included in the results as they were not found on our database.</p>}
         {selectedU ? 
         <div className="results__table">
            <DataGrid rows={filteredResults} columns={columns} pageSize={5}/>
         </div> 
         : <p>you haven't selected any universities!</p>}
      </div>
   )
   : (
      <div> loading </div>
   )
}

export default Results
