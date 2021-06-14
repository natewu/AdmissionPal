import React from 'react'

function About() {
   return (
      <div className="aboutUS" style={{display:"flex", flexFlow:"column", alignContent:"center"}}>
         <h2>Why did we make this?</h2>
         <p>
         Applying to universities can be stressful, there are a lot of places you can go and not a lot of answers. University websites are inconsistent, difficult to sort through, and having dozens of tabs open just to compare a few universities is less than optimal. This becomes even more difficult when you try to search for Alberta-specific course requirements.
         </p>
         <p>
         It has always been hard to decide on a university to apply to, even more nowadays where teenagers struggled through a pandemic and admission averages go up every year.
         </p>
         <p>
         When considering the future, it is easy to make things complicated. What kind of average do I need? Which Alberta courses do I need? What kind of programs am I interested in? What are my options out there? Comparing universities becomes a lot more difficult when you are considering all of these factors.
         </p>
         <p>
         Our site, Admission Pal demonstrates the possibilities of converting complex issues of university finding into a simple task by making it understandable and readable by humans.
         </p>
         <p>

         <h2>Who are we?</h2>
         We are a group of highschoolers who are passionate about programming and computer science. Within the project, we were able to find major issues that impact youth today. One of them is finding a university, which is a major issue that will impact us soon. As a result, we worked together to create a project that concerns the youth of today.
         </p>
         <h2>The future of the Website:</h2>
         <p>
         The website could easily be expanded with the creation of more majors and more information. The kind of information that we are missing are majors that are outside of: "Software Engineering", "Computer Science", "Mathematics", "Architecture", "Psychology", "Commerce", "Art". As it stands, the skeleton of Admission Pal provides a strong basis for the future of university navigation.
         </p>
         <a className="github" href="https://github.com/natewu/AdmissionPal" target="_blank" rel="noreferrer"><img src={process.env.PUBLIC_URL+ "/GitHub_logo.png"} alt="github"/></a>
      </div>
   )
}

export default About
