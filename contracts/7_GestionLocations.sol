// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract GestionLocations {
    
    address public immutable proprietaire;
    enum EtatContrat { EnAttente, Actif, Termine }


    struct Contrat {
        uint montant;
        EtatContrat etat;
    }

    mapping(address => Contrat) public contrats;


    event ContratCree(address indexed locataire, uint montant);
    event LoyerPaye(address indexed locataire, uint montant);
    event ContratCloture(address indexed locataire);
    modifier seulementProprietaire() {
        require(msg.sender == proprietaire, "Seul le proprietaire peut appeler cette fonction");
        _;
    }


    constructor() {
        proprietaire = msg.sender;
    }


    function ajouterContrat(address locataire, uint montant) external seulementProprietaire {

        require(contrats[locataire].montant == 0, "Le locataire a deja un contrat");
        require(locataire != address(0), "Adresse locataire invalide");
        require(montant > 0, "Le montant doit etre superieur a zero");


        contrats[locataire] = Contrat({
            montant: montant,
            etat: EtatContrat.EnAttente
        });


        emit ContratCree(locataire, montant);
    }


    function payerLoyer() external payable {

        Contrat storage contrat = contrats[msg.sender];
        require(contrat.montant > 0, "Aucun contrat trouve pour ce locataire");
        require(contrat.etat == EtatContrat.EnAttente, "Le contrat n'est pas en attente");
        require(msg.value == contrat.montant, "Le paiement doit etre egal au montant du loyer");
        contrat.etat = EtatContrat.Actif;
        emit LoyerPaye(msg.sender, msg.value);
    }


    function cloturerMonContrat(address locataire) external seulementProprietaire {

        Contrat storage contrat = contrats[locataire];
        require(contrat.montant > 0, "Aucun contrat trouve pour ce locataire");
        require(contrat.etat != EtatContrat.Termine, "Le contrat est deja termine");


        contrat.etat = EtatContrat.Termine;


        emit ContratCloture(locataire);
    }
}