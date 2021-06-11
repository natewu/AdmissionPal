import React, { useEffect, useState } from 'react'
import { useSelector } from "react-redux";
import { selectMajor, selectUniversity } from "../utils/data";

function Results() {

   const selectedU = useSelector(selectUniversity);
   const selectedM = useSelector(selectMajor);

   const [uni, setUni] = useState([]);

   useEffect(() => {
      fetch("universities")
      .then(res => res.json())
      .then((uni) => (
         setUni(
            uni.map((uni) => ({
               id: uni.Uni_ID,
               name: uni.Uni_Name
            }))
         )
      ));
   }, [])

   // useEffect(() => {
   //    console.log(selectedU.universities)
   // }, [])

   return (
      <div>
         {uni.map((uni) => 
            <li>{uni.name}</li>
         )}
         {selectedU ? <li>{selectedU.universities}</li> : <p>you haven't selected any universities!</p>}
      </div>
   )
}

export default Results
