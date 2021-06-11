export function getUniversities(){
   var universities = [];
   fetch("universities")
   .then(res => res.json())
   .then(uni => universities.push(...uni))
   .then(()=> console.log(universities))
   return universities;
}