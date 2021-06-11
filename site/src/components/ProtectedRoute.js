import React from 'react'
import {Route, Redirect} from "react-router-dom";

function ProtectedRoute({component: Component, auth, params, redirect, ...rest}) {
   const route = redirect
   return (
      <Route
         {...rest}
         render={
            (props) => auth
            ? <Component {...params} {...props}/>
            : <Redirect to={{ pathname:route, state:{from: props.location} }}/>
         }
      />
   )
}

export default ProtectedRoute
