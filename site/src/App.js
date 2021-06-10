import React from 'react'
import { BrowserRouter as Router, Redirect, Route, Switch } from "react-router-dom";
import "./styles/App.scss"
import Nav from "./components/Nav.js"
import Universities from "./components/Universities.js"
import Majors from "./components/Majors.js"

export default function App() {
  return (
    <div style={{display:"flex", flexFlow:"column", height:"100vh"}}>
      <Nav/>
      <Router>
        <Switch>
          <Route exact path="/" component={Universities}/>
          <Route path="/majors" component={Majors}/>
        </Switch>
      </Router>
    </div>
  )
}
