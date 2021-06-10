import React, { useCallback, useState } from 'react'
import {TextField, RadioGroup, FormControlLabel, Radio, Button} from "@material-ui/core"
import ChipInput from 'material-ui-chip-input'
import { useHistory } from "react-router";
import { useDispatch, useSelector } from "react-redux";
import { selectUniversity, setMajor, setUniversity } from "../utils/data.js";

export default function Universities() {
   const history = useHistory();
   const next = useCallback(() => history.push('/majors'), [history]);
   const [universities, setUniversities] = useState([])
   const [error, setError] = useState(null);
   const [selection, setSelection] = useState(null);
   const dispatch = useDispatch();
   const university = useSelector(selectUniversity);
   function handleRadio(e){
      e.preventDefault();
      setSelection(e.target.value);
   }


   function validateInput(selection, handleError, universities, next){

      if(selection==="university"){
         universities.length !== 0 ? HandleUniversitiesNext(next, universities)
         : university.universities !== 0 ? next()
         : handleError("please select universities");
      }
      else if(selection==="all"){
         HandleAllNext(next);
      }
      else{
         handleError("please choose an option");
      }
   }
   
   const HandleUniversitiesNext = (next, universities) => {
      dispatch(
         setUniversity({
            type: "selection",
            universities: universities
         })
      )
      next();
      return null;
   }
   const HandleAllNext = (next) => {
      dispatch(
         setUniversity({
            type:'all'
         })
      )
      next();
      return null;
   }

   return (
      <div className="content">
         <h2>What universities are you interested in?</h2>

      <RadioGroup className="selection" /* value={value} */ onChange={(e) => handleRadio(e)}>
         <FormControlLabel className="option" value="university" control={<Radio color="primary"/>} 
            label={
            <ChipInput
               defaultValue={university !== null ? university.universities : ""}
               onChange={(chips) => setUniversities(chips)}
            />
            } 
         />
         <FormControlLabel className="option" value="all" control={<Radio color="primary" />} label="all" />
      </RadioGroup>
      <Button className="next" type="submit" color="primary" variant="outlined" size="large" onClick={() => validateInput(selection, setError, universities, next)}>Next</Button>

      {error ? <p style={{color:"red"}}>{error}</p> : null}

      </div>
   )
}


