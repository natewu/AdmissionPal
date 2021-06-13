from bs4 import BeautifulSoup
import requests
import csv

source = requests.get(
    "https://www.macleans.ca/education/canadian-universities-minimum-entering-grades-by-faculty/").text

csv_file = open('UniData.csv', 'w')
csv_writer = csv.writer(csv_file,lineterminator = '\n')
csv_writer.writerow(["University","Minimum entering grade: Arts","Minimum entering grade: Science","Minimum entering grade: Commerce"
                     ,"Minimum entering grade: Engineering"])

soup = BeautifulSoup(source, 'lxml')
for table in soup.find("tbody").find_all("tr"):
    wholetable = table.text.split("\n")
    wholetable.pop(0)
    wholetable.pop(-1)
    wholetable[0] = wholetable[0].replace("�","e")
    print(wholetable)
    csv_writer.writerow(wholetable)

csv_file.close()
