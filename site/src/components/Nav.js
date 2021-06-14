import React, { useEffect } from 'react'
import "../styles/Nav.scss"
import InfoIcon from '@material-ui/icons/Info';

export default function Nav() {

   return (
      <nav className="nav">
         {/* <h1>AdmissionPal</h1> */}
         <a href="/" style={{width: "100%"}}>
            <img className="ico" src={process.env.PUBLIC_URL+ "/Logo1.svg"} alt="AdmissionPal"/>
            <img className="logo" src={process.env.PUBLIC_URL+ "/TextLogo.svg"} alt="AdmissionPal"/>
         </a>
         <a href="/about" className="about">
            <InfoIcon/>
            <h3>About</h3>
         </a>
      </nav>
   )
}
