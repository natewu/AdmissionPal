import React, { useState, useCallback, useEffect } from 'react'
import {TextField, RadioGroup, FormControlLabel, Radio, Button} from "@material-ui/core"
import ChipInput from 'material-ui-chip-input'
import Autocomplete from "@material-ui/lab/Autocomplete";
import Chip from "@material-ui/core/Chip";
import {useHistory} from 'react-router-dom';
import { createDispatchHook, useDispatch, useSelector } from "react-redux";
import { selectMajor, selectUniversity, setMajor } from "../utils/data.js";


export default function Majors() {
   const history = useHistory();
   const back = useCallback(() => history.push('/'), [history]);
   const [majors, setMajors] = useState([]);

   const [majorSuggest, setMajorSuggest] = useState([]);

   const university = useSelector(selectUniversity);
   const dispatch = useDispatch()

   const HandleMajorsNext = (next, universities) => {
      if(majors.length !== 0){
         dispatch(
            setMajor({
               majors: majors
            })
         );
      }
      history.push("/results");
      return null;
   }

   function Suggestion(){
      fetch("majors/types")
      .then(res => res.json())
      .then((major) => {
         for(var i = 0; i < major.length; i++){
            majorSuggest[i] = major[i].Major_Name
         }
      })
   }

   useEffect(() => {
      Suggestion();
   }, [])

   const AutoSelect = (e, chips) =>{
      setMajors(chips);
   }

   return (
      <div className="content">
         
         {university.type === "selection" ? 
         <h2 className="majors">What major(s) from {
            university.universities.map(university => 
               <em key={university}>{university}, </em>
            ) 
         }are you interested in?</h2>
         : <h2> What major(s) are you interested in? </h2>
         }
         
         {/* <ChipInput className="selection"
               defaultValue={majors}
               onChange={(chips) => setMajors(chips)}
         /> */}
         <Autocomplete
               multiple
               autoHighlight="true"
               id="select-uni"
               options={
                  majorSuggest
               }
               onChange={AutoSelect}
               getOptionLabel={option => option}
               renderTags={(value, getTagProps) =>
                 value.map((option, index) => (
                   <Chip
                     label={<p style={{whiteSpace: 'normal'}}>{option}</p>}
                     {...getTagProps({ index })}
                     // disabled={index === 0}
                     style={{height:"100%"}}
                   />
                 ))
               }
               style={{ minWidth: 300 }}
               renderInput={params => (
                  <TextField
                  {...params}
                  />
               )}
               
               />
      <Button className="next" type="submit" color="primary" variant="outlined" size="large" onClick={() => HandleMajorsNext()}>Next</Button>
      <Button className="next" type="submit" color="primary" variant="outlined" size="large" onClick={() => back()}>Back</Button>
      </div>
   )
}
