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

############################################### Metaarrays

@onready var m_answerstate := [
	"error: incorrectly entered answerstate", 
	answerstate_1, 
	answerstate_2,
	answerstate_3
	]

@onready var m_answerlist :=[
	"error: incorrectly entered answerlist",
	answerlist_1,
	answerlist_2,
	answerlist_3
	]

@onready var m_answersq := [
	"error: incorrectly entered answersq",
	answersq_1,
	answersq_2,
	answersq_3
	]

@onready var m_q = [
	"error: incorrectly entered q",
	q_1,
	q_2,
	q_3
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

