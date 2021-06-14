import React, { useCallback, useEffect, useRef, useState } from 'react'
import {TextField, RadioGroup, FormControlLabel, Radio, Button} from "@material-ui/core"
import ChipInput from 'material-ui-chip-input';
import Chip from "@material-ui/core/Chip";
import Autocomplete from "@material-ui/lab/Autocomplete";
import { useHistory } from "react-router";
import { useDispatch, useSelector } from "react-redux";
import { selectUniversity, setMajor, setUniversity } from "../utils/data.js";

export default function Universities() {
   const history = useHistory();
   const next = useCallback(() => history.push('/majors'), [history]);
   const [universities, setUniversities] = useState([])
   const [error, setError] = useState(null);
   const uniRef = useRef()
   const input = useRef()
   const [selection, setSelection] = useState(null);
   const dispatch = useDispatch();
   const university = useSelector(selectUniversity);
   var [unis, setUnis] = useState([]);
   var [unisuggest, setUnisuggest] = useState([]);

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
      
      fetch("universities")
      .then(res => res.json())
      .then((uni) => {
         for(var i = 0; i < uni.length; i++){
            unis[i] = uni[i].Uni_Name
         }
      })
      .then(() => {
         dispatch(
            setUniversity({
               type:'all',
               universities: unis
            })
         )
         next()
      })
      
      return null;
   }

   function Suggestion(){
      fetch("universities")
      .then(res => res.json())
      .then((uni) => {
         for(var i = 0; i < uni.length; i++){
            unisuggest[i] = uni[i].Uni_Name
         }
      })
   }

   useEffect(() => {
      Suggestion();
   }, [])

   const AutoSelect = (e, chips) =>{
      setUniversities(chips);
      setSelection("university");
   }
   
   return (
      <div className="content">
         <h2>What universities are you interested in?</h2>
      <RadioGroup className="selection" /* value={value} */ onChange={(e) => handleRadio(e)}>
         <FormControlLabel className="option" ref={uniRef} value="university" control={<Radio color="primary"/>} 
            label={
               /* {<ChipInput
               ref={input} 
               defaultValue={university !== null ? university.universities : ""}
               onChange={(chips) => AutoSelect(chips)}
               onClick={() => {
                  if(selection !== "university"){
                     uniRef.current.click();
                     input.current.focus();
                  }
                  else{
                     return null;
                  }
               }}
               />} */
               <Autocomplete
               multiple
               autoHighlight="true"
               id="select-uni"
               options={
                  unisuggest
               }
               defaultValue={((university !== null)) ? university.universities : []}
               getOptionLabel={option => option}
               
               renderTags={(value, getTagProps) =>
                 value.map((option, index) => (
                   <Chip
                     label={<p style={{whiteSpace: 'normal'}}>{option}</p>}
                     {...getTagProps({ index })}
                     style={{height:"100%"}}
                   />
                 ))
               }
               onChange={AutoSelect}
               style={{ minWidth: 300 }}
               renderInput={params => (
                  <TextField
                  ref={input}
                  {...params}
                  onClick={() => {
                  if(selection !== "university"){
                     uniRef.current.click();
                     input.current.focus();
                  }
                  else{
                     return null;
                  }
                  }}
                  />
               )}
               
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


