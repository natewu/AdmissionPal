import React, { useEffect, useState } from 'react'
import { DataGrid } from '@material-ui/data-grid';
import { useSelector } from "react-redux";
import { selectMajor, selectUniversity } from "../utils/data";

function Results() {
   const [loading, setLoading] = useState(true);
   const [fetchU, setFetchU] = useState(false);
   const selectedU = useSelector(selectUniversity);
   const selectedM = useSelector(selectMajor);

   const [filterU, setFilterU] = useState([]);
   var [filterM, setFilterM] = useState([]);

   const [uni, setUni] = useState([]);
   const [majors, setMajors] = useState([]);

   function search(indexer, indexed, returnHook ){
      var results = [];
      for(var selection = 0; selection < indexer.universities.length; selection++){
         for(var filter = 0; filter < indexed.length; filter++){
            if(indexed[filter].university.toLowerCase() === indexer.universities[selection].toLowerCase()) {
               results.push(indexed[filter].university);
               // console.log(indexed[filter].university, indexer.universities[selection]);
            }
            else{
               console.log("nothing");
            }
         }
      }
      if(results.length !== 0){
         setLoading(false);
         returnHook(
            results.map((res, index) => ({
               id: index,
               university: res
            }))
         );
         console.log("loading done")
      }
      else{
         setLoading(false);
      }
   }

   useEffect(() => {
      fetch("universities")
      .then(res => res.json())
      .then((uni) => (
         setUni(
            uni.map((uni) => ({
               id: uni.Uni_ID,
               university: uni.Uni_Name
            }))
         )
      ))
      .then(() => setFetchU(true))
   }, [])

   useEffect(() => {
      search(selectedU, uni, setFilterU)  
   }, [fetchU])

   const columns = [
      { field: 'university', headerName: 'University', width: 200 },
      { field: 'major', headerName: 'Major', width: 130 },
      { field: 'avg', headerName: 'Admission Average', width: 200 },
      { field: 'courses', headerName: 'Required Courses', width: 200 },
   ]

   return !loading ? (
      <div className="content__results">
         <h2>Results</h2>
         {selectedU.universities.length === filterU.length ? null : <p>Some universities you have searched were not included in the results as they were not found on our database.</p>}
         {selectedU ? 
         <div className="results__table">
            <DataGrid rows={filterU} columns={columns} pageSize={5}/>
         </div> 
         : <p>you haven't selected any universities!</p>}
         
      </div>
   )
   : (
      <div> loading </div>
   )
}

export default Results
