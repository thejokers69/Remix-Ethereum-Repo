// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

contract ContratVente {
    address payable public _vendeur;
    address public _acheteur;
    uint256 public _prix;            
    enum EtatVente { Disponible, Paye, Livre }
    EtatVente public etat;

    constructor(uint256 _prixInitial) {
        _vendeur = payable(msg.sender);
        _prix = _prixInitial;
        etat = EtatVente.Disponible;
    }
    
    function acheter() public payable {
        require(etat == EtatVente.Disponible, "L'article n'est pas disponible");
        require(msg.value == _prix, "Montant exact requis");
        
        _acheteur = msg.sender;
        etat = EtatVente.Paye;
    }
   
    function confirmerLivraison() public {
        require(msg.sender == _vendeur, "Seul le vendeur peut confirmer");
        require(etat == EtatVente.Paye, "L'article doit etre paye d'abord");
        
        etat = EtatVente.Livre;
        _vendeur.transfer(address(this).balance);
    }
    
    function rembourserAcheteur() public {
        require(msg.sender == _vendeur, "Seul le vendeur peut rembourser");
        require(etat == EtatVente.Paye, "L'article doit etre paye pour remboursement");
        
        payable(_acheteur).transfer(address(this).balance);
        etat = EtatVente.Disponible;
        _acheteur = address(0);  
    }
    
    
    function getEtat() public view returns (EtatVente) {
        return etat;
    }
}