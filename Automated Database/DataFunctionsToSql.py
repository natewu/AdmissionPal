import csv
from bs4 import BeautifulSoup
import requests

with open('E:\Dnld\scrapedinfo2.csv', newline='') as f:
    reader = csv.reader(f)
    data = list(reader)

print(data)

majorlist = [
  "Software Engineering",
  "Computer Science",
  "Mathematics",
  "Architecture",
  "Psychology",
  "Commerce",
  "Art"
]

# The following functions are from GetAllDataFunctions.py (adapted for SQL purposes)

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

def getRecommendedCourses(Program):
    input = Program.replace(" ", "-").lower()
    dict = {"software-engineering": "software-eng",
            "art": "honours-arts",
            "commerce": "honours-arts-business",
            "psychology": "honours-arts"
            }
    if input in dict:
        input = dict[input]
    source = requests.get(
    f"https://uwaterloo.ca/future-st"
    f"udents/admissions/admission-requirements/{input}/canada/alberta/").text
    soup = BeautifulSoup(source, 'lxml')
    content = soup.find(id="block-system-main")
    titles = content.find("div","section")
    output = []
    for info in titles.find_all("li"):
        output.append(info.text)
    print(output)
    return output

requirements_list = []
for major in majorlist:
    requirements_list.append(getRecommendedCourses(major))

for k, r in enumerate(requirements_list):
    for j, i in enumerate(r):
        requirements_list[k][j] = i.split(' --')[0]
    requirements_list[k] = (', '.join(requirements_list[k]))
    requirements_list[k] = 'Required courses: ' + requirements_list[k]

uni_id = 8
major_id = 51
for info in data:
    #print('(' + str(uni_id) + ', \'' + info[0] + "\', ''),")
    
    print('(' + str(major_id) + ', 1, ' + str(uni_id) + ", \'" + info[4] + "*\', \'" + requirements_list[0] + "\'),")
    major_id += 1
    print('(' + str(major_id) + ', 2, ' + str(uni_id) + ", \'" + info[2] + "*\', \'" + requirements_list[1] + "\'),")
    major_id += 1
    print('(' + str(major_id) + ', 3, ' + str(uni_id) + ", \'" + '0' + "\', \'" + requirements_list[2] + "\'),")
    major_id += 1
    print('(' + str(major_id) + ', 4, ' + str(uni_id) + ", \'" + '0' + "\', \'" + requirements_list[3] + "\'),")
    major_id += 1
    print('(' + str(major_id) + ', 5, ' + str(uni_id) + ", \'" + '0' + "\', \'" + requirements_list[4] + "\'),")
    major_id += 1
    print('(' + str(major_id) + ', 6, ' + str(uni_id) + ", \'" + info[3] + "*\', \'" + requirements_list[5] + "\'),")
    major_id += 1
    print('(' + str(major_id) + ', 7, ' + str(uni_id) + ", \'" + info[1] + "*\', \'" + requirements_list[6] + "\'),")
    major_id += 1
    uni_id += 1

#print(requirements_list)
#print(getRecommendedAllAverages("english"))