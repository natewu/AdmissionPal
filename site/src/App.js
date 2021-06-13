import React, { useEffect, useState } from 'react'
import { BrowserRouter as Router, Redirect, Route, Switch } from "react-router-dom";
import "./styles/App.scss"
import Nav from "./components/Nav.js";
import Universities from "./components/Universities.js";
import Majors from "./components/Majors.js";
import Results from "./components/Results.js";
import About from "./components/About.js";
import ProtectedRoute from "./components/ProtectedRoute.js";
import { useSelector } from "react-redux";
import { selectMajor, selectUniversity } from "./utils/data";

export default function App() {

  const university = useSelector(selectUniversity);
  const majors = useSelector(selectMajor);

  return (
    <div style={{display:"flex", flexFlow:"column", height:"100vh"}}>
      <Nav/>
      <Router>
        <Switch>
          <Route exact path="/" component={Universities}/>
          <Route exact path="/about" component={About}/>
          <ProtectedRoute path="/majors" auth={university} redirect={"/"} component={Majors}/>
          <ProtectedRoute path="/results" auth={majors} redirect={"/majors"} component={Results}/>
        </Switch>
      </Router>
    </div>
  )
}
