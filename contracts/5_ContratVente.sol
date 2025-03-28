// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract ContratVente{

    uint256 _prix;
    string _article;
    address payable public _vendeur;
    address public _acheteur;
    enum EtatVente{Disponible, Paye, Livre }
    EtatVente etat;

    constructor(string memory article){
        _vendeur=payable (msg.sender);
        etat=EtatVente.Disponible;
        _article=article;
    }
    function acheter()public payable {
        _acheteur=msg.sender;
        _prix=msg.value;
        etat=EtatVente.Paye;
        _vendeur.transfer(msg.value);
    }
    function livrer()public {
        etat=EtatVente.Livre;
    }
    function getEtat()public view returns(EtatVente){
        return etat;
    }
}