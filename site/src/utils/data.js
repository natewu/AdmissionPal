import {createSlice} from "@reduxjs/toolkit";

export const universityData = createSlice({
   name: "university",
   initialState: {
      universitySelection: null,
      majorSelection: null
   },
   reducers: {
      setUniversity: (state, action) => {
         state.universitySelection = action.payload;
      },
      setMajor: (state, action) => {
         state.majorSelection = action.payload;
      },
   }
});

export const { setUniversity, setMajor } = universityData.actions;

export const selectUniversity = (state) => state.university.universitySelection;
export const selectMajor = (state) => state.university.majorSelection;

export default universityData.reducer;