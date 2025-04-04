// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ProductMarket {
    
    struct Product {
        string name;
        uint price;
        uint stock;
    }

    mapping(uint => Product) public products;
    uint public productCount;
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    
    modifier onlyOwner() {
        require(msg.sender == owner, "Acces refuse: seulement le proprietaire");
        _;
    }
    
    event ProductAdded(uint id, string name);
    event ProductUpdated(uint id, string name);
    event ProductDeleted(uint id);

    

    
    function addProduct(string memory _name, uint _price, uint _stock) external onlyOwner {
        productCount++;
        products[productCount] = Product(_name, _price, _stock);
        emit ProductAdded(productCount, _name);
    }

    
    function updateProduct(uint _id, string memory _name, uint _price, uint _stock) external onlyOwner {
        require(_id > 0 && _id <= productCount, "Produit invalide");

        Product storage prod = products[_id];
        prod.name = _name;
        prod.price = _price;
        prod.stock = _stock;

        emit ProductUpdated(_id, _name);
    }

    
    function deleteProduct(uint _id) external onlyOwner {
        require(_id > 0 && _id <= productCount, "Produit invalide");

        delete products[_id];
        emit ProductDeleted(_id);
    }

    
    function getProduct(uint _id) public view returns (string memory, uint, uint) {
        require(_id > 0 && _id <= productCount, "Produit invalide");

        Product memory prod = products[_id];
        return (prod.name, prod.price, prod.stock);
    }

    
    function copyProduct(uint _id) public view returns (Product memory) {
        require(_id > 0 && _id <= productCount, "Produit invalide");

        Product memory copiedProduct = products[_id];
        return copiedProduct;
    }
}
