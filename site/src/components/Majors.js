import React, { useState, useCallback, useEffect } from 'react'
import {TextField, RadioGroup, FormControlLabel, Radio, Button} from "@material-ui/core"
import ChipInput from 'material-ui-chip-input'
import {useHistory} from 'react-router-dom';
import { useSelector } from "react-redux";
import { selectMajor, selectUniversity } from "../utils/data.js";


export default function Majors() {
   const history = useHistory();
   const back = useCallback(() => history.push('/'), [history]);
   const [majors, setMajors] = useState([])

   const university = useSelector(selectUniversity);

   useEffect(() => {
      console.log(university.universities);
   }, []);

   return (
      <div className="content">
         
         {university.type === "selection" ? 
         <h2 className="majors">What major(s) from {
            university.universities.map(university => 
               <em>{university}, </em>
            ) 
         }are you interested in?</h2>
         : <h2> What major(s) are you interested in? </h2>
         }
         
         <ChipInput className="selection"
               defaultValue={majors}
               onChange={(chips) => setMajors(chips)}
         />
      <Button className="next" type="submit" color="primary" variant="outlined" size="large">Next</Button>
      <Button className="next" type="submit" color="primary" variant="outlined" size="large" onClick={() => back()}>Back</Button>
      </div>
   )
}
