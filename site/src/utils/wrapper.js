import {configureStore} from "@reduxjs/toolkit";
import universityR from "./data.js";

export const wrapper = configureStore({
   reducer:{
      university: universityR,
   }
});