#include <iostream>
#include <string>
#include <ctime>
#include "ACNH.h"

int main()
{
	srand(time(0));
	person human;
	human.name = "Korkuzyabra";
	std::cout << "name         " << human.name << std::endl;
	human.birthday = "6.05.2001";
	std::cout << "birthday     " << human.birthday << std::endl;
	human.persanality = "Cranky";
	human.gender = "Female";
	std::cout << "gender       " << human.gender << std::endl;
	std::cout << "persanality  " << human.persanality << std::endl;
	human.type = "Human";
	std::cout << "type         " << human.type << std::endl;
	human.eyes = "Green";
	std::cout << "eye          " << human.eyes << std::endl;
	human.hair = "Light brown";
	std::cout << "hair         " << human.hair << std::endl;
	std::cout << "skill        "<<human.GetSkills() <<std::endl;
	human.island = "Kinana";
	std::cout << "island       " << human.island << std::endl;
	std::cout << "---------------------------------------------" << std::endl;
	animals cat;
	cat.name = "Ankha";
	std::cout << "name         " << cat.name << std::endl;
	cat.birthday = "22.09";
	std::cout << "birthday     " << cat.birthday << std::endl;
	cat.gender = "Female";
	std::cout << "gender       " << cat.gender << std::endl;
	cat.persanality = "Snooty";
	std::cout << "persanality  " << cat.persanality << std::endl;
	cat.type = "Cat";
	std::cout << "type         " << cat.type << std::endl;
	cat.popularity = 5;
	std::cout << "popularity   " << cat.popularity << std::endl;
	cat.home = cat.HowHome(cat);
	std::cout << "home         " << cat.home << std::endl;
	cat.island = "Kinana";
	std::cout << "island       " << cat.island << std::endl;
	std::cout << "---------------------------------------------" << std::endl;
	animals rabbit;
	rabbit.name = "Coco";
	std::cout << "name         " << rabbit.name << std::endl;
	rabbit.birthday = "01.03";
	std::cout << "birthday     " << rabbit.birthday << std::endl;
	rabbit.gender = "Female";
	std::cout << "gender       " << rabbit.gender << std::endl;
	rabbit.persanality = "Normal";
	std::cout << "persanality  " << rabbit.persanality << std::endl;
	rabbit.type = "Rabbit";
	std::cout << "type         " << rabbit.type << std::endl;
	rabbit.popularity = 15;
	std::cout << "popularity   " << rabbit.popularity << std::endl;
	rabbit.home = rabbit.HowHome(rabbit);
	std::cout << "home         " << rabbit.home << std::endl;
	rabbit.island = "Kinana";
	std::cout << "island       " << rabbit.island << std::endl;
	std::cout << "---------------------------------------------" << std::endl;
	animals lion;
	lion.name = "Mott";
	std::cout << "name         " << lion.name << std::endl;
	lion.birthday = "10.07";
	std::cout << "birthday     " << lion.birthday << std::endl;
	lion.gender = "Male";
	std::cout << "gender       " << lion.gender << std::endl;
	lion.persanality = "Jock";
	std::cout << "persanality  " << lion.persanality << std::endl;
	lion.type = "Lion";
	std::cout << "type         " << lion.type << std::endl;
	lion.popularity = 218;
	std::cout << "popularity   " << lion.popularity << std::endl;
	lion.home = lion.HowHome(lion);
	std::cout << "home         " << lion.home << std::endl;
	lion.island = "Kinana";
	std::cout << "island       " << lion.island << std::endl;
	std::cout << "---------------------------------------------" << std::endl;
	animals dog;
	dog.name = "Lucky";
	std::cout << "name         " << dog.name << std::endl;
	dog.birthday = "04.11";
	std::cout << "birthday     " << dog.birthday << std::endl;
	dog.gender = "Male";
	std::cout << "gender       " << dog.gender << std::endl;
	dog.persanality = "Lazy";
	std::cout << "persanality  " << dog.persanality << std::endl;
	dog.type = "Dog";
	std::cout << "type         " << dog.type << std::endl;
	dog.popularity = 9;
	std::cout << "popularity   " << dog.popularity << std::endl;
	dog.home = dog.HowHome(dog);
	std::cout << "home         " << dog.home << std::endl;
	dog.island = "Kinana";
	std::cout << "island       " << dog.island << std::endl;
	std::cout << "---------------------------------------------" << std::endl;
	std::cout << "         Top animals characters:            " << std::endl;
	if (cat < dog)
	{
		std::cout << "1. " + cat.name << std::endl;
		cat.rarity = "Rerity";
	}
	if (dog < rabbit)
	{
		std::cout << "2. " + dog.name << std::endl;
		dog.rarity = "Rerity";
	}
	if (lion > rabbit)
	{
		std::cout << "3. " + rabbit.name << std::endl;
		rabbit.rarity = "Not rerity";
	}
	std::cout << "4. " + lion.name << std::endl;
	lion.rarity = "Not rerity";
	std::cout << "---------------------------------------------" << std::endl;
	std::cout << "         They are rerity?            " << std::endl;
	if (cat == dog)
		std::cout << cat.name + " and " + dog.name + " both are rerity " << std::endl;
	if (rabbit == lion)
		std::cout << rabbit.name + " and " + lion.name + " both aren't rerity " << std::endl;
	std::cout << "---------------------------------------------" << std::endl;
	std::cout << "          Animal move out                    " << std::endl;
	dog = "Tratalin";
	std::cout << dog.name + " move out on " + dog.island << std::endl;
	std::cout << "---------------------------------------------" << std::endl;
	std::cout << "          They are frends?                 " << std::endl;
	std::cout << human.name + " and " + cat.name + frendship_with_person(human, cat) << std::endl;
	std::cout << human.name + " and " + rabbit.name + frendship_with_person(human, rabbit) << std::endl;
	std::cout << human.name + " and " + lion.name + frendship_with_person(human, lion) << std::endl;
	std::cout << human.name + " and " + dog.name + frendship_with_person(human, dog) << std::endl;
	return 0;
}