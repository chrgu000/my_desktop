#~ import fun_modules;
#~ from fun_modules import add_nums as add1;


#~ 变量的是使用

#~ name = "miao 33 zhiri";

#~ print(name.title());

#~ arr = ['mzr',11,11.1,11,11,False,["22333",44],"last"];
#~ arr.append("你好啊");
#~ arr.insert(1, "插入");
#~ del arr[0];

#~ last = arr.pop(2);
#~ print(arr);
#~ print(last);
#~ print(arr[len(arr)-1]);
#~ arr.remove(11);
#~ arr.remove(False);
#~ print(arr);

#~ names = ["zhangsan", "www", "print", "console"];
#~ names.sort()

#~ print(names);

#~ names.sort(reverse=True);
#~ print(names);
#~ print(sorted(names));
#~ for item in names:
	#~ print(item);
#~ for item in names: 
	#~ print(item);
	#~ print("内部");
	
#~ print("外部");
#~ for item in range(0, 10):
	#~ print(item);

#~ for num in range(0,10,2):
	#~ print(num);

#~ sequre = [];

#~ for item in range(1, 11):
	#~ tem = item**2;
	#~ sequre.append(tem);

#~ print(sequre);

#~ list= [1, 4, 9, 16, 25, 36, 49, 64, 81, 100];

#~ print(max(list));
#~ print(min(list));
#~ print(sum(list));

#~ lists = [1,2,3,4,5];
#~ print(lists[0:3])
#~ print(lists[:3]);
#~ print(lists[3:]);
#~ print(lists[:]);
#~ print(lists[-3:])

#~ cars = ["aodi", 'benshi', 'Bmw', 'toyata'];
#~ for car in cars:
	#~ if car == "Bmw":
		#~ print(car.lower())
	#~ else:
		#~ print(car.title())

#~ car = 'bwm';
#~ print(car == 'bmw');

#~ age = 29;
#~ if(age > 18) and (age < 20):
	#~ print('此用户19岁');
#~ else:
	#~ print('此用户不是19岁')

#~ cars = ['baoma','benci'];
#~ car = 'baoa';

#~ if car not in cars: 
	#~ print("不在里面");


#~ list = [1,2,3,4];

#~ if list:
	#~ for item in list:
		#~ print(item);
#~ else:
	#~ print("列表为空");


#~ dictionnary = {'name': 'miaozhiru', 'age': 100};
#~ print(dictionnary['name']);

#~ print(dictionnary)
#~ dictionnary['sex'] = "男性";
#~ print(dictionnary);

#~ del dictionnary['age'];
#~ print(dictionnary);


#~ dic1 = {
	#~ 'name':'mzr',
	#~ 'age':100,
	#~ 'sex':'male',
	#~ 'hh':100
#~ }
#~ print(dic1);


#~ dic1 = {
	#~ "name":"mzr",
	#~ "age": 100,
	#~ "sex": "男"
#~ }

#~ for key, value in dic1.items():
	#~ print(key + '----------' + str(value));

#~ for key in dic1.keys():
	#~ print(key)


#~ for key in sorted(dic1.keys()):
	#~ print(key);


#~ for value in set(dic1.values()):
	#~ print(value);


#~ friends = [];

#~ for counter in range(0, 30):
	#~ friend = {'name':'xxx','age':counter}
	#~ friends.append(friend);
	
#~ print(friends);

#~ for friend in friends[:5]:
	#~ print(friend);

#~ print("总书是:"+str(len(friends)));

#~ msg = input('please input you name:');

#~ print(type (msg))

#~ counter = 1;
#~ while counter <=5:
	#~ print(counter)
	#~ counter+=1


#~ active = True;
#~ while active:
	#~ msg = input('请输入姓名');
	#~ if(msg=='quit'):
		#~ active = False;
	#~ else: 
		#~ print(msg);
		
#~ print('while end');

#~ cars = ['bmw','benci','bmw'];
#~ while 'bmw' in cars:
	#~ cars.remove('bmw');
#~ print(cars);

#~ students = {};
#~ doing = True;
#~ while doing:


#~ student = {};
#~ donging = True;
#~ while donging:
	#~ name = input('请输入您的姓名:');
	#~ age = input('请输入您的年龄:');
	#~ student[name] = age;

	
	#~ askInfo = input('继续输输入吗?yes/no');
	#~ if(askInfo == 'no'):
		#~ donging = False;
#~ print('end');

#~ print(student);
#~ for key,value in student.items():
	#~ print(key+'-------'+value);


#~ def printHello():
	#~ print('hello');
	
#~ printHello();

#~ def printHello(name):
	
	#~ print('hello'+name);
	
#~ printHello('mzr');


#~ def sum(x,y,x):
	#~ print(x+y+x);
	
#~ sum(1,2,3)

#~ def sum(x,y,z):
	#~ print(x+y+z);
#~ sum(x=1,z=3,y=2);

#~ def sum(x,y,z=4):
	#~ print(x+y+z);

#~ sum(1,2)

#~ def sum(x,y,z):
	#~ result = x+y+z;
	#~ return result;
#~ result = sum(1,2,3);
#~ print(result);

#~ def print_friends(names):
	#~ names.append(900);
	#~ for name in names:
		#~ print(name);

#~ friends = ['zhangsan', 'lisi', 'wangwu'];
#~ print_friends(friends);


#~ def sum(*nums):
	#~ result = 0;
	#~ for n in nums:
		#~ result += n;
		
	#~ return result;
	
#~ r = sum(1,2,3,4);
#~ print(r);

#~ def createUser(name,**params):
	#~ user = {};
	#~ user['name']=name;
	#~ for key,value in params.items():
		#~ user[key] = value;
	
	#~ return user;

#~ user = createUser('miao', age=10,sex='男');
#~ print(user);


#~ print(add1(1,2,3,4,5));


#~ 定义一个类
#~ class Dog():
	#~ def __init__(self, name, age):
		#~ self.name = name;
		#~ self.age = age;
	
	#~ def eatBone(self):
		#~ print(self.name+"is eating bone");
	
	#~ def bark(self):
		#~ print(self.name+"is barking");


#~ myDog = Dog('xiaogougou', 10);

#~ print(myDog.name);
#~ print(myDog.age);
#~ myDog.eatBone();
#~ myDog.bark();

#~ class PetDog(Dog):
	#~ """写下当前类的注释"""
	#~ def __init__(self,name, age):
		#~ """写下当前函数的注释"""
		#~ super().__init__(name,age);
		#~ self.food = [];
		
	#~ def printFood(self):
		#~ if self.food:	
			#~ print(self.food);


#~ my_pet_dog = PetDog('xiaohai',1);


#~ my_pet_dog.food = ['gouliang', 'xxx'];

#~ my_pet_dog.printFood(); 

#~ def dog():
	#~ print(111);

















































