import matplotlib.pyplot as pp
import sys

if len(sys.argv) < 2:
	achsenwechsel = 1
	name = 'data.txt'
elif len(sys.argv) == 2:
	achsenwechsel = int(sys.argv[1])
	name = 'data.txt'
else:
	achsenwechsel = int(sys.argv[1])
	name = sys.argv[2]

zu_plotten1 = []
zu_plotten2 = []

data = [[],[],[],[],[],[]]

with open(name, 'r') as file:
	for line in file:
		for (index,wert) in enumerate(line.split(',')):
			if index == 0:
				continue
			data[index-1].append(float(wert))

if achsenwechsel:
	for each in data[0:3]:
		zu_plotten1.append(sum(each)/len(each))

	for each in data[3:]:
		zu_plotten2.append(sum(each)/len(each))

	pp.plot(zu_plotten1, 'r')
	pp.plot(zu_plotten1, 'ro')
	pp.plot(zu_plotten2, 'b')
	pp.plot(zu_plotten2, 'bo')
	pp.xlabel('Sustantiv          Verb          Adjektiv')
	pp.axis([0,2,0,10])

else:
	zu_plotten3 = []
	zu_plotten1.append(sum(data[0])/len(data[0]))
	zu_plotten1.append(sum(data[3])/len(data[3]))
	zu_plotten2.append(sum(data[1])/len(data[1]))
	zu_plotten2.append(sum(data[4])/len(data[4]))
	zu_plotten3.append(sum(data[2])/len(data[2]))
	zu_plotten3.append(sum(data[5])/len(data[5]))
	pp.plot(zu_plotten1, 'r')
	pp.plot(zu_plotten1, 'ro')
	pp.plot(zu_plotten2, 'b')
	pp.plot(zu_plotten2, 'bo')
	pp.plot(zu_plotten3, 'g')
	pp.plot(zu_plotten3, 'go')
	pp.axis([0,1,0,10])
	pp.xlabel('Durchgang 1               Durchgang 2')
pp.gca().axes.get_xaxis().set_ticklabels([])

pp.ylabel('# richtige Worte')
pp.grid(True)
pp.show()
