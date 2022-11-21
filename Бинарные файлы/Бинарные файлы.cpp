#include <iostream>
#include<vector>
#include <fstream>

struct scan_info {
	char model[25];
	int price;
	double x_size;
	double y_size;
	int optr;
	int grey;
};


int getScan(int num, int m) {
	if ((num <= m) && (num>0))
	{
		std::ifstream in("scan_data.bin", std::ios::in | std::ios::binary);
		int x;
		in.read((char*)&x, sizeof(x));
		scan_info scan;
		for (int i = 0; i < num; i++)
			in.read((char*)&scan, sizeof(scan));
		std::cout << std::endl << scan.model << std::endl << scan.price << std::endl << scan.x_size << std::endl
			<< scan.y_size << std::endl << scan.optr << std::endl << scan.grey << std::endl;
		return 0;
	}
	else
	{
		std::cout << "Scaner not found" << std::endl;
		return -1;
	}
}

int Input()
{
	std::vector <scan_info> info;
	std::ofstream out("scan_data.bin", std::ios::out | std::ios::binary);
	int m;
	do {
		std::cout << "Scaners number: " << std::endl;
		if ((std::cin >> m).good());
		if (std::cin.fail())
		{
			std::cin.clear();
			std::cout << "Enter eror. Repeat. \n";
		}
		std::cin.ignore(std::numeric_limits<std::streamsize>::max(), '\n');
	} while (m < 1);
	out.write((char*)&m, sizeof(m));
	scan_info item;
	for (int i = 0; i < m; i++)
	{
		std::cout << std::endl << "Scaner #" << i + 1 << std::endl << std::endl;
		std::cout << "Model: ";
		std::cin >> item.model;
		do {
			std::cout << std::endl << "Price: " << std::endl;
			if ((std::cin >> item.price).good());
			if (std::cin.fail())
			{
				std::cin.clear();
				std::cout << "Enter eror. Repeat. \n";
			}
			std::cin.ignore(std::numeric_limits<std::streamsize>::max(), '\n');
		} while (item.price < 1);
		do {
			std::cout << std::endl << "X_size: " << std::endl;
			if ((std::cin >> item.x_size).good());
			if (std::cin.fail())
			{
				std::cin.clear();
				std::cout << "Enter eror. Repeat. \n";
			}
			std::cin.ignore(std::numeric_limits<std::streamsize>::max(), '\n');
		} while (item.x_size < 1);
		do {
			std::cout << std::endl << "Y_size: " << std::endl;
			if ((std::cin >> item.y_size).good());
			if (std::cin.fail())
			{
				std::cin.clear();
				std::cout << "Enter eror. Repeat. \n";
			}
			std::cin.ignore(std::numeric_limits<std::streamsize>::max(), '\n');
		} while (item.y_size < 1);
		do {
			std::cout << std::endl << "Optr: " << std::endl;
			if ((std::cin >> item.optr).good());
			if (std::cin.fail())
			{
				std::cin.clear();
				std::cout << "Enter eror. Repeat. \n";
			}
			std::cin.ignore(std::numeric_limits<std::streamsize>::max(), '\n');
		} while (item.optr < 1);
		do {
			std::cout << std::endl << "Gray: " << std::endl;
			if ((std::cin >> item.grey).good());
			if (std::cin.fail())
			{
				std::cin.clear();
				std::cout << "Enter eror. Repeat. \n";
			}
			std::cin.ignore(std::numeric_limits<std::streamsize>::max(), '\n');
		} while (item.grey < 1);
		out.write((char*)&item, sizeof(item));
	}
	out.close();
	return m;
}
int main()
{
	int m, n;
	m = Input();
	std::cout << "Insert number of scanner to print please: ";
	std::cin >> n;
	getScan(n, m);
	return 0;
}