from bs4 import BeautifulSoup
import requests
import csv

UniName = open("uni_names.txt", "r")
nameList = []
AverageDict = dict()
#basic format for scraping
def basicScrape(soup,id):
    output = []
    for table in soup.find("tbody").find_all("tr"):
        wholetable = table.text.split("\n")
        wholetable.pop(0)
        wholetable.pop(-1)
        wholetable[0] = wholetable[0].replace("�","e").replace("é","e").replace("'","")
        for index in range(len(wholetable)):
            wholetable[index] = wholetable[index].replace("*", "")
        output.append(wholetable)
        if(id == "average"):
            AverageDict[wholetable[0].replace("University","").replace("of","").replace(" ","")] = wholetable[1]
    return output

#Function to get rank of Major:
def getRanking(program):
    Program = program.lower().replace(" ", "-")
    programranking = f"https://www.macleans.ca/education/canadas-best-university-{Program}-programs-2021-rankings/"

    request = requests.get(programranking)
    if request.status_code == 200:
        source = requests.get(programranking).text
    soup = BeautifulSoup(source, 'lxml')
    output = basicScrape(soup)
    return output

#Function to get averages:
def getRecommendedAllAverages(command):
    #examples: print(getRecommendedAllAverages("average")), ouput: waterloo: 90%, Calgary: 85%....
    #examples: print(getRecommendedAllAverages("computer science")), ouput: 1,waterloo,1,1, ....
    dict={"all": "https://www.macleans.ca/education/canadian-universities-minimum-entering-grades-by-faculty/",
    "average": "https://www.macleans.ca/education/what-grades-do-i-need-to-get-into-canadian-universities/",
    }
    link = "https://www.macleans.ca/education/what-grades-do-i-need-to-get-into-canadian-universities/"
    if command in dict:
        link = dict[command]
    source = requests.get(link).text
    soup = BeautifulSoup(source, 'lxml')

    output = basicScrape(soup,command)
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

def getTuition(universityname):
    university = universityname.split(" ")
    searchString = ""
    for i in range(len(university)):
        university[i] = university[i]
        university[i] = (university[i][0].upper() + university[i][1:]).replace("Of", "of").replace(".","")
        addon = "-"
        if(i == len(university) - 1):
            addon = ""
        searchString += university[i] + addon
    source = requests.get(
        f"https://www.macleans.ca/schools/{searchString}/").text
    soup = BeautifulSoup(source, 'lxml')
    output = ""
    try:
        content = soup.find("div","single-article-text").text
        index = 1
        for line in content.split("\n"):
            if index == 0:
                output = line
                index = -1
            if line.startswith("Tuition"):
                index = 0
        output = output.replace("$","").replace(",","").split(" ")
        output = output[0]
    except:
        print("cannot be found")
    return [output,universityname]

def arrayToCSV(Parent,Map1,Map2):
    csv_file = open("UniData.csv",'w')
    csv_writer = csv.writer(csv_file,lineterminator='\n')
    csv_writer.writerow(["Uni","Art","Science","Business","Engineering","Average","Tuition"])
    for i in range(len(Parent)):
        row1 = Parent[i]
        uniname = row1[0].replace(" ", "")
        average = Map1.get(uniname)
        tuition = Map2.get(uniname)
        output = []
        for element in row1:
            output.append(element)
        output.append(average)
        output.append(tuition)
        csv_writer.writerow(output)
    csv_file.close()


ListOfTuitions = []
MainAverages = []
Averages = []
tuitionDict = dict()
for x in UniName:
    value = x.replace("\n", "")
    tuition, name = getTuition(value)
    ListOfTuitions.append(tuition)
    tuitionDict[name.replace("University","").replace("of","").replace(" ","")] = tuition
UniName.close()

MainAverages = getRecommendedAllAverages("all")
Averages = getRecommendedAllAverages("average")

arrayToCSV(MainAverages,AverageDict,tuitionDict)
