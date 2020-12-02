#include <iostream>
#include<string.h>
using namespace std;
struct studento
{
	int rank, birthday;
	string name, surname, group;
};

struct node {
	int value;
	studento student;
	node* left; 
	node* right;
};

class btree {
public:
	btree();

	void insert(studento key);
	void delete_group(string key);
	void inorder_print();
	void inorder_print_by_Val();
private:
	void inorder_print_by_Val(node* leaf, int rank);
	void deleting(node* leaf);
	node* minValueNode(node* node);
	node* deleteNode(node* root);
	void insert(studento key, node* leaf);
	void delete_group(string key, node* leaf);
	void inorder_print(node* leaf);
	node* root;
};


btree::btree() {
	root = NULL;
}


void Print(studento A);

void btree::insert(studento key, node* leaf) {

	if (key.rank < leaf->value) {
		if (leaf->left != NULL) {
			insert(key, leaf->left);
		}
		else {
			leaf->left = new node;
			leaf->left->value = key.rank;
			leaf->left->student = key;
			leaf->left->left = NULL;
			leaf->left->right = NULL;
		}
	}
	else if (key.rank >= leaf->value) {
		if (leaf->right != NULL) {
			insert(key, leaf->right);
		}
		else {
			leaf->right = new node;
			leaf->right->value = key.rank;
			leaf->right->student = key;
			leaf->right->right = NULL;
			leaf->right->left = NULL;
		}
	}

}

void btree::insert(studento key) {
	if (root != NULL) {
		insert(key, root);
	}
	else if (key.rank == NULL) {
		return;
	}
	else {
		root = new node;
		root->value = key.rank;
		root->student = key;
		root->left = NULL;
		root->right = NULL;
	}
}
void btree::deleting(node* leaf) {
	leaf = NULL;
};


void btree::delete_group(string key) {
	delete_group(key, root);
}


void btree::delete_group(string key, node* leaf) {
	if (leaf != NULL) {
		if (key.compare(leaf->student.group) == 0) {
			node* newleaf = deleteNode(leaf);
				leaf = newleaf;
		}
		if (leaf != NULL) {
			if (leaf->left != NULL)
			delete_group(key , leaf->left);
			if (leaf->right != NULL) 
			delete_group(key , leaf->right);
		};
	};
return;
}




/* Given a binary search tree and a key, this function
deletes the key and returns the new root */
node* btree::deleteNode(node* leaf)
{
	if (leaf == NULL ) {
		return NULL;
	}
	if (leaf->left == NULL && leaf->right == NULL) {
		leaf->value = NULL;
		return NULL;
	}
        if (leaf->left == NULL) {
            struct node* temp = leaf->right;
			leaf->right->value = NULL;
			return temp;
        }
        else if (leaf->right == NULL) {
            struct node* temp = leaf->left;
			leaf->left->value =NULL;
            return temp;
        }
			// node with two children: Get the inorder successor
			// (smallest in the right subtree)
			struct node* temp = minValueNode(leaf->right);

			// Copy the inorder successor's content to this node
			leaf->value = temp->value;
			leaf->student = temp->student;
			deleteNode(leaf->right);

		return leaf;
}

node* btree::minValueNode(node* node)
{
	struct node* current = node;

	/* loop down to find the leftmost leaf */
	while (current && current->left != NULL)
		current = current->left;

	return current;
}



void btree::inorder_print() {
	cout << endl;
	inorder_print(root);
}


void btree::inorder_print(node* leaf) {
	if (leaf != NULL ) {
		if (leaf->value != NULL) {
			inorder_print(leaf->left);
			Print(leaf->student);
			inorder_print(leaf->right);
		}
	}
}

void btree::inorder_print_by_Val() {
	cout << "print all nodes with value higher than: "<< endl;
	int x;
	cin >> x;
	inorder_print_by_Val(root, x);
}


void btree::inorder_print_by_Val(node* leaf, int rank) {
	if (leaf != NULL) {
		if (leaf->value != NULL) {
			inorder_print_by_Val(leaf->left, rank);
			if (leaf->student.rank > rank) {
				Print(leaf->student);
			};
			cout << endl;
			inorder_print_by_Val(leaf->right, rank);
		}
	}
}

void Print(studento A) {
	cout << "___________________" << endl;
	cout << A.name<< endl;
	cout << A.surname << endl;
	cout << A.birthday << endl;
	cout << A.group << endl;
	cout << A.rank << endl;
	cout << "___________________" << endl;
}



void addMember(btree* tree) {
	studento X;
	cout << "Name: ";
	cin >> X.name;
	cout << "Surname: ";
	cin >> X.surname;
	cout << "Birthday: ";
	cin >> X.birthday;
	cout << "Group: ";
	cin >> X.group;
	cout << "Ranking: ";
	cin >> X.rank;
	tree->insert(X);
}


int main() {
	btree* tree = new btree();
	addMember(tree);
	addMember(tree);
	addMember(tree);
	addMember(tree);
	tree->delete_group("hololive");
	tree->inorder_print_by_Val();
	delete tree;

}