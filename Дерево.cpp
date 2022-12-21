#include <iostream>
#include <tuple>

int tabs = 0;
int kol_vo = 0;

struct node
{
	char liter;
	int data;
	node* next;
	node* prev;
};

struct crown
{
	node* head;
	node* tail;
};

struct tree
{
	crown* crown;
	tree* left;
	tree* right;
};

void delTree(tree*& branch)
{
	if (!branch)
		return;
	delTree(branch->left);
	delTree(branch->right);
	delete branch;
	branch = nullptr;
	return;
}

void Add(char buk, int val, crown*& list)
{
	node* carrent = new node;
	carrent->liter = buk;
	carrent->data = val;
	carrent->next = nullptr;
	carrent->prev = nullptr;
	if (list == nullptr) 
	{
	    list = new crown;
		list->head = new node;
		list->tail = new node;
		list->head->next = nullptr;
		list->head->prev = nullptr;
		list->tail->next = nullptr;
		list->tail->prev = nullptr;
		list->head = carrent;
		list->tail = carrent;
	}
	else
	{
		carrent->prev = list->tail;
		list->tail->next = carrent;
		list->tail = carrent;
	}

}

void Add(char buk, int val, tree*& branch)
{
	if (!branch)
	{
		branch = new tree;
		branch->crown = new crown;
		branch->crown = nullptr;
		Add(buk, val, branch->crown);
		branch->left = 0;
		branch->right = 0;
	}
	else
		if (std::tie(branch->crown->head->liter, branch->crown->head->data) != (std::tie(buk, val)))
		{
			if (std::tie(branch->crown->head->liter, branch->crown->head->data) < (std::tie(buk, val)))
			{
				Add(buk, val, branch->left);
			}
			else
			{
				Add(buk, val, branch->right);
			}
		}
		else
			Add(buk, val, branch->crown);
}

void Delcrown(crown*& list)
{
	if (list->head != list->tail)
	{
		node* oldtail = list->tail;
		list->tail = oldtail->prev;
		list->tail->next = nullptr;
		delete oldtail;
		oldtail = nullptr;
	}
	else
	{
		list->head = nullptr;
		list->tail = nullptr;
	}
}

tree* deleteNode(char buk, int val, tree*& branch)
{
	if (branch == nullptr)
		return branch;
	if (branch->crown->head->next == nullptr)
	{
		if (std::tie(branch->crown->head->liter, branch->crown->head->data) == (std::tie(buk, val)))
		{
			tree* tmp;
			if (branch->right == nullptr)
				tmp = branch->left;
			else
			{
				tree* ptr = branch->right;
				if (ptr->left == nullptr)
				{
					ptr->left = branch->left;
					tmp = ptr;
				}
				else
				{
					tree* pmin = ptr->left;
					while (pmin->left != nullptr)
					{
						ptr = pmin;
						pmin = ptr->left;
					}
					ptr->left = pmin->right;
					pmin->left = branch->left;
					pmin->right = branch->right;
					tmp = pmin;
				}
			}
			delete branch;
			return tmp;
		}
		else if (std::tie(branch->crown->head->liter, branch->crown->head->data) < (std::tie(buk, val)))
			branch->left = deleteNode(buk, val, branch->left);
		else
			branch->right = deleteNode(buk, val, branch->right);
	}
	else
		Delcrown(branch->crown);
	return branch;
}

bool search(char buk, int val, tree* branch)
{
	if (branch != nullptr)
	{
		if (std::tie(branch->crown->head->liter, branch->crown->head->data) == (std::tie(buk, val)))
			return true;
		else
			if (std::tie(branch->crown->head->liter, branch->crown->head->data) < (std::tie(buk, val)))
				return search(buk, val, branch->left);
			else
				return search(buk, val, branch->right);
	}
	else
		return false;
}

int heigh(tree* branch)
{
	if (branch != nullptr)
		return 1 + std::max(heigh(branch->left), heigh(branch->right));
}

void print(tree* branch)
{
	if (!branch)
		return;
	tabs += 5;
	print(branch->left);
	for (int i = 0; i < tabs; i++)
		std::cout << " ";
	std::cout << branch->crown->head->liter;
	std::cout << branch->crown->head->data << std::endl;
	print(branch->right);
	tabs -= 5;
	return;
}

int main()
{
	tree* branch = nullptr;
	Add('A', 103, branch);
	Add('D', 659, branch);
	Add('A', 52, branch);
	Add('G', 659, branch);
	Add('A', 52, branch);
	Add('A', 52, branch);
	Add('A', 650, branch);
	Add('A', 10, branch);
	print(branch);
	std::cout << std::endl << std::endl << std::endl;
	branch = deleteNode('A', 52, branch);
	print(branch);
	branch = deleteNode('A', 52, branch);
	print(branch);
	branch = deleteNode('A', 52, branch);
	print(branch);
	delTree(branch);
	print(branch);
	std::cout << search('A', 103, branch) << std::endl;
	std::cout << search('A', 113, branch) << std::endl;
	std::cout << heigh(branch) - 1<< std::endl;
}
