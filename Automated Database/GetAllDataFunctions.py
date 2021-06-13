from bs4 import BeautifulSoup
import requests
import re

#"all",
#"University",
#"Minimum entering grade: Arts",
#"Minimum entering grade: Science",
#"Minimum entering grade: Commerce",
#"Minimum entering grade: Engineering"

#"average", 2: average

#Function to get averages and rankings:
def getRecommendedAllAverages(command):
    #examples: print(getRecommendedAllAverages("average")), ouput: waterloo: 90%, Calgary: 85%....
    #examples: print(getRecommendedAllAverages("computer science")), ouput: 1,waterloo,1,1, ....
    dict={"all": "https://www.macleans.ca/education/canadian-universities-minimum-entering-grades-by-faculty/",
    "average": "https://www.macleans.ca/education/what-grades-do-i-need-to-get-into-canadian-universities/",
    }
    link = "https://www.macleans.ca/education/what-grades-do-i-need-to-get-into-canadian-universities/"
    if command in dict:
        link = dict[command]
    Program = command.lower().replace(" ", "-")
    programranking = f"https://www.macleans.ca/education/canadas-best-university-{Program}-programs-2021-rankings/"

    request = requests.get(programranking)
    if request.status_code == 200:
        source = requests.get(programranking).text
    else:
        source = requests.get(link).text

    soup = BeautifulSoup(source, 'lxml')
    output = []
    for table in soup.find("tbody").find_all("tr"):
        wholetable = table.text.split("\n")
        wholetable.pop(0)
        wholetable.pop(-1)
        wholetable[0] = wholetable[0].replace("�","e").replace("é","e")
        for index in range(len(wholetable)):
            wholetable[index] = wholetable[index].replace("*", "")
        output.append(wholetable)
    return output
#When inputting, put "average" or "all" to get the information documented above
#when you put in a major that exists in ranking, it will output a:
#1 ranking, university, Program Reputation, Research Reputation,
#when nothing is found, it will return the averages of the schools.


#Function to get required courses for major:
def getRecommendedCourses(Program):
    #examples: print(getRecommendedCourses("biology")), output: english 30-1
    uniProgram = Program.replace(" ", "-").lower()
    dict = {"software-engineering": "software-eng",
            "art": "honours-arts",
            "commerce": "honours-arts",
            "business": "business-admin-math",
            }
    if uniProgram in dict:
        uniProgram = dict[uniProgram]
    source = requests.get(
        f"https://uwaterloo.ca/future-students/admissions/admission-requirements/{uniProgram}/canada/alberta/").text
    soup = BeautifulSoup(source, 'lxml')
    content = soup.find(id="block-system-main")
    titles = content.find("div","section")
    output = []
    for info in titles.find_all("li"):
        output.append(info.text)
    return output

def getRecommendedCourses(university):
    university = university.split(" ")
    searchString = ""
    for i in range(len(university)):
        university[i] = university[i]
        university[i] = (university[i][0].upper() + university[i][1:]).replace("Of", "of")
        addon = "-"
        if(i == len(university) - 1):
            addon = ""
        searchString += university[i] + addon
    source = requests.get(
        f"https://www.macleans.ca/schools/{searchString}/").text
    soup = BeautifulSoup(source, 'lxml')
    content = soup.find("div","single-article-text")
    tuition = soup.body.findAll(text='$7,041')
    print(tuition)
print(getRecommendedCourses("university of calgary"))
