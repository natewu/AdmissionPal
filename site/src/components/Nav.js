import React from 'react'
import "../styles/Nav.scss"

export default function Nav() {
   return (
      <nav className="nav">
         {/* <h1>AdmissionPal</h1> */}
         <a href="/"><img className="logo" src={process.env.PUBLIC_URL+ "/TextLogo.svg"} alt="AdmissionPal"/></a>
      </nav>
   )
}
