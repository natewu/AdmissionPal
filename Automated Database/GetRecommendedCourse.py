from bs4 import BeautifulSoup
import requests

def getRecommendedCourses(Program):
    input = Program.replace(" ", "-").lower()
    dict = {"software-engineering": "software-eng",
            "art": "honours-arts",
            "commerce": "honours-arts",
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
    return output
print(getRecommendedCourses("art"))
