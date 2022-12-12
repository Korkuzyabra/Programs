#pragma once

class character
{
public:
	std::string name;
	std::string birthday;
	std::string gender;
	std::string persanality;
	std::string type;
	std::string island;
};

class animals;
class person : public character
{
	friend std::string frendship_with_person(person, animals);
public:
	std::string hair;
	std::string eyes;
	std::string skin;
	int GetSkills()
	{
		return skills = rand() % 101;
	}
private:
	int skills;
	int frendlevel = 76;
};

class animals : public character
{
	friend std::string frendship_with_person(person, animals);
public:
	int popularity;
	std::string home;
	std::string HowHome(animals object)
	{
		if (persanality == "Normal")
			return object.home = "Antique setting";
		if (persanality == "Jock")
			return object.home = "Cute setting";
		if (persanality == "Lazy")
			return object.home = "Rattan setting";
		if (persanality == "Snooty")
			return object.home = "Asian setting";
	}
	bool operator<(const animals& object)
	{
		return object.popularity > popularity;
	}
	bool operator>(const animals& object)
	{
		return object.popularity < popularity;
	}
	bool operator==(const animals& object)
	{
		return object.rarity == rarity;
	}
	std::string rarity;
	animals operator=(std::string object)
	{
		this->island = object;
		return*this;
	}
private:
	int frendship = rand() % 101;
};

std::string frendship_with_person(person object, animals object1)
{
	if (object.frendlevel>= object1.frendship)
		return " are frends";
	else
		return "s aren't frends";
}