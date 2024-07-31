extends Node

var time_start = 0
var time_now = 0

var scene = 0
var opensc = 0
var teststate := 0
var mainzoom := 20.0
var campp := Vector2(-5.43, -1.27)


var hovering = false
var listindex = 0
var listnumber = 0
var selected = 0

var pages := [1, 0, 0]

var quizpage := 0

############################################### COMPLETION

var progres_list := [
	1, 
	0, 
	0,
	0, 
	0, 
	0,
	0, 
	0, 
	0,
	0, 
	5
]

############################################### Meta arrays

@onready var m_answerstate := [
	"error: incorrectly entered answerstate", 
	answerstate_1, 
	answerstate_2,
	answerstate_3,
	answerstate_2,
	answerstate_3,
	answerstate_4,
	answerstate_5,
	answerstate_6,
	answerstate_7,
	answerstate_8,
	answerstate_9,
	answerstate_10,
	answerstate_11,
	answerstate_12
	]

@onready var m_answerlist :=[
	"error: incorrectly entered answerlist",
	answerlist_1,
	answerlist_2,
	answerlist_3,
	answerlist_4,
	answerlist_5,
	answerlist_6,
	answerlist_7,
	answerlist_8,
	answerlist_9,
	answerlist_10,
	answerlist_11,
	answerlist_12
	]

@onready var m_answersq := [
	"error: incorrectly entered answersq",
	answersq_1,
	answersq_2,
	answersq_3,
	answersq_4,
	answersq_5,
	answersq_6,
	answersq_7,
	answersq_8,
	answersq_9,
	answersq_10,
	answersq_11,
	answersq_12
	]


@onready var m_q = [
	"error: incorrectly entered q",
	q_1,
	q_2,
	q_3,
	q_4,
	q_5,
	q_6,
	q_7,
	q_8,
	q_9,
	q_10,
	q_11,
	q_12
	]
	
	

############################################### 1

var answerstate_1 := [0, 0, 0, 0, 0, 0]

var answerlist_1 :=[
	"",
	"PEHMEÄ SUULAKI",
	"KURKUNKANSI",
	"HENKITORVI",
	"NENÄONTELO",
	"SUUONTELO",
	"ÄÄNIHUULET"
	]

var answersq_1 := [4, 5, 1, 2, 6, 3]
var q_1 = false

############################################### 2

var answerstate_2 := [0, 0, 0]

var answerlist_2 :=[
	"",
	"Faryngeaalinen vaihe ",
	"Esofageaalinen vaihe ",
	"Oraalinen vaihe "
	]

var answersq_2 := [3, 1, 2,]

var q_2 = false

############################################### 3

var answerstate_3 := [0, 0, 0]

var answerlist_3 :=[
	"",
	"Ruokapala kulkee nielun läpi kohti ruokatorvea. Refleksien ohjaamaa toimintaa.",
	"Ruokapala kulkee ruokatorvessa kohti mahalaukkua peristaltiikan kuljettamana. ",
	"Pääosin tahdonalaista toimintaa, joka aloittaa ruuansulatuksen. Vaihe päättyy reflektiivisen toiminnan käynnistyessä. ",
	]

var answersq_3 := [3, 1, 2,]

var q_3 = false

############################################### 4

var answerstate_4 := [0, 0, 0]

var answerlist_4 :=[
	"",
	"Ruokapala kulkee nielun läpi kohti ruokatorvea. Refleksien ohjaamaa toimintaa.",
	"Ruokapala kulkee ruokatorvessa kohti mahalaukkua peristaltiikan kuljettamana. ",
	"Pääosin tahdonalaista toimintaa, joka aloittaa ruuansulatuksen. Vaihe päättyy reflektiivisen toiminnan käynnistyessä. ",
	]

var answersq_4 := [3, 1, 2,]

var q_4 = false

############################################### 5

var answerstate_5 := [0, 0, 0]

var answerlist_5 :=[
	"",
	"Ruokapala kulkee nielun läpi kohti ruokatorvea. Refleksien ohjaamaa toimintaa.",
	"Ruokapala kulkee ruokatorvessa kohti mahalaukkua peristaltiikan kuljettamana. ",
	"Pääosin tahdonalaista toimintaa, joka aloittaa ruuansulatuksen. Vaihe päättyy reflektiivisen toiminnan käynnistyessä. ",
	]

var answersq_5 := [3, 1, 2,]

var q_5 = false

############################################### 6

var answerstate_6 := [0, 0, 0]

var answerlist_6 :=[
	"",
	"Ruokapala kulkee nielun läpi kohti ruokatorvea. Refleksien ohjaamaa toimintaa.",
	"Ruokapala kulkee ruokatorvessa kohti mahalaukkua peristaltiikan kuljettamana. ",
	"Pääosin tahdonalaista toimintaa, joka aloittaa ruuansulatuksen. Vaihe päättyy reflektiivisen toiminnan käynnistyessä. ",
	]

var answersq_6 := [3, 1, 2,]

var q_6 = false

############################################### 7

var answerstate_7 := [0, 0, 0]

var answerlist_7 :=[
	"",
	"Ruokapala kulkee nielun läpi kohti ruokatorvea. Refleksien ohjaamaa toimintaa.",
	"Ruokapala kulkee ruokatorvessa kohti mahalaukkua peristaltiikan kuljettamana. ",
	"Pääosin tahdonalaista toimintaa, joka aloittaa ruuansulatuksen. Vaihe päättyy reflektiivisen toiminnan käynnistyessä. ",
	]

var answersq_7 := [3, 1, 2,]

var q_7 = false

############################################### 8

var answerstate_8 := [0, 0, 0]

var answerlist_8 :=[
	"",
	"Ruokapala kulkee nielun läpi kohti ruokatorvea. Refleksien ohjaamaa toimintaa.",
	"Ruokapala kulkee ruokatorvessa kohti mahalaukkua peristaltiikan kuljettamana. ",
	"Pääosin tahdonalaista toimintaa, joka aloittaa ruuansulatuksen. Vaihe päättyy reflektiivisen toiminnan käynnistyessä. ",
	]

var answersq_8 := [3, 1, 2,]

var q_8 = false

############################################### 9

var answerstate_9 := [0, 0, 0]

var answerlist_9 :=[
	"",
	"Ruokapala kulkee nielun läpi kohti ruokatorvea. Refleksien ohjaamaa toimintaa.",
	"Ruokapala kulkee ruokatorvessa kohti mahalaukkua peristaltiikan kuljettamana. ",
	"Pääosin tahdonalaista toimintaa, joka aloittaa ruuansulatuksen. Vaihe päättyy reflektiivisen toiminnan käynnistyessä. ",
	]

var answersq_9 := [3, 1, 2,]

var q_9 = false

############################################### 10

var answerstate_10 := [0, 0, 0]

var answerlist_10 :=[
	"",
	"Ruokapala kulkee nielun läpi kohti ruokatorvea. Refleksien ohjaamaa toimintaa.",
	"Ruokapala kulkee ruokatorvessa kohti mahalaukkua peristaltiikan kuljettamana. ",
	"Pääosin tahdonalaista toimintaa, joka aloittaa ruuansulatuksen. Vaihe päättyy reflektiivisen toiminnan käynnistyessä. ",
	]

var answersq_10 := [3, 1, 2,]

var q_10 = false

############################################### 11

var answerstate_11 := [0, 0, 0]

var answerlist_11 :=[
	"",
	"Ruokapala kulkee nielun läpi kohti ruokatorvea. Refleksien ohjaamaa toimintaa.",
	"Ruokapala kulkee ruokatorvessa kohti mahalaukkua peristaltiikan kuljettamana. ",
	"Pääosin tahdonalaista toimintaa, joka aloittaa ruuansulatuksen. Vaihe päättyy reflektiivisen toiminnan käynnistyessä. ",
	]

var answersq_11 := [3, 1, 2,]

var q_11 = false

############################################### 12

var answerstate_12 := [0, 0, 0]

var answerlist_12 :=[
	"",
	"Ruokapala kulkee nielun läpi kohti ruokatorvea. Refleksien ohjaamaa toimintaa.",
	"Ruokapala kulkee ruokatorvessa kohti mahalaukkua peristaltiikan kuljettamana. ",
	"Pääosin tahdonalaista toimintaa, joka aloittaa ruuansulatuksen. Vaihe päättyy reflektiivisen toiminnan käynnistyessä. ",
	]

var answersq_12 := [3, 1, 2,]

var q_12 = false
