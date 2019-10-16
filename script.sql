
CREATE TABLE public.Ingredient (
                nom VARCHAR(64) NOT NULL,
                CONSTRAINT ingredient_pk PRIMARY KEY (nom)
);


CREATE TABLE public.ElementStocks (
                nom VARCHAR(64) NOT NULL,
                quantite DOUBLE PRECISION NOT NULL,
                grandeur VARCHAR(20) NOT NULL,
                CONSTRAINT elementstocks_pk PRIMARY KEY (nom)
);


CREATE SEQUENCE public.produit_produit_id_seq;

CREATE TABLE public.Produit (
                produit_id INTEGER NOT NULL DEFAULT nextval('public.produit_produit_id_seq'),
                nom VARCHAR(64) NOT NULL,
                descriptif VARCHAR(2000) NOT NULL,
                prixUnitaireHT DOUBLE PRECISION NOT NULL,
                tauxTVA100 DOUBLE PRECISION NOT NULL,
                valeursNutritionnelles VARCHAR(2000) NOT NULL,
                CONSTRAINT produit_pk PRIMARY KEY (produit_id)
);


ALTER SEQUENCE public.produit_produit_id_seq OWNED BY public.Produit.produit_id;

CREATE SEQUENCE public.composition_composition_id_seq;

CREATE TABLE public.Composition (
                composition_id INTEGER NOT NULL DEFAULT nextval('public.composition_composition_id_seq'),
                nom VARCHAR(64) NOT NULL,
                produit_id INTEGER NOT NULL,
                quantite INTEGER NOT NULL,
                grandeur VARCHAR(20) NOT NULL,
                CONSTRAINT composition_pk PRIMARY KEY (composition_id, nom, produit_id)
);


ALTER SEQUENCE public.composition_composition_id_seq OWNED BY public.Composition.composition_id;

CREATE SEQUENCE public.utilisateur_utilisateur_id_seq;

CREATE TABLE public.Utilisateur (
                utilisateur_id INTEGER NOT NULL DEFAULT nextval('public.utilisateur_utilisateur_id_seq'),
                nom VARCHAR(100) NOT NULL,
                prenom VARCHAR(100) NOT NULL,
                numero INTEGER NOT NULL,
                CONSTRAINT utilisateur_pk PRIMARY KEY (utilisateur_id)
);


ALTER SEQUENCE public.utilisateur_utilisateur_id_seq OWNED BY public.Utilisateur.utilisateur_id;

CREATE TABLE public.Personnel (
                utilisateur_id INTEGER NOT NULL,
                nom_compte VARCHAR(32) NOT NULL,
                mot_de_passe VARCHAR(100) NOT NULL,
                role VARCHAR(16) NOT NULL,
                CONSTRAINT personnel_pk PRIMARY KEY (utilisateur_id)
);


CREATE TABLE public.Client (
                utilisateur_id INTEGER NOT NULL,
                nom_compte VARCHAR(32),
                mot_de_passe VARCHAR(100),
                CONSTRAINT client_pk PRIMARY KEY (utilisateur_id)
);


CREATE SEQUENCE public.adresse_adresse_id_seq;

CREATE TABLE public.Adresse (
                adresse_id INTEGER NOT NULL DEFAULT nextval('public.adresse_adresse_id_seq'),
                voie VARCHAR(64) NOT NULL,
                code_postal INTEGER NOT NULL,
                localite VARCHAR(64) NOT NULL,
                utilisateur_id INTEGER NOT NULL,
                CONSTRAINT adresse_pk PRIMARY KEY (adresse_id)
);


ALTER SEQUENCE public.adresse_adresse_id_seq OWNED BY public.Adresse.adresse_id;

CREATE TABLE public.Panier (
                panier_id INTEGER NOT NULL,
                utilisateur_id INTEGER NOT NULL,
                produit_id INTEGER NOT NULL,
                CONSTRAINT panier_pk PRIMARY KEY (panier_id)
);


CREATE TABLE public.Commande (
                numero_commande VARCHAR NOT NULL,
                date DATE NOT NULL,
                suivi VARCHAR(32) NOT NULL,
                panier_id INTEGER NOT NULL,
                CONSTRAINT commande_pk PRIMARY KEY (numero_commande)
);


ALTER TABLE public.ElementStocks ADD CONSTRAINT ingr_dient_elementstocks_fk
FOREIGN KEY (nom)
REFERENCES public.Ingredient (nom)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.Composition ADD CONSTRAINT ingr_dient_composition_fk
FOREIGN KEY (nom)
REFERENCES public.Ingredient (nom)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.Composition ADD CONSTRAINT produit_composition_fk
FOREIGN KEY (produit_id)
REFERENCES public.Produit (produit_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.Panier ADD CONSTRAINT produit_panier_fk
FOREIGN KEY (produit_id)
REFERENCES public.Produit (produit_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.Client ADD CONSTRAINT utilisateur_client_fk
FOREIGN KEY (utilisateur_id)
REFERENCES public.Utilisateur (utilisateur_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.Personnel ADD CONSTRAINT utilisateur_personnel_fk
FOREIGN KEY (utilisateur_id)
REFERENCES public.Utilisateur (utilisateur_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.Panier ADD CONSTRAINT client_panier_fk
FOREIGN KEY (utilisateur_id)
REFERENCES public.Client (utilisateur_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.Adresse ADD CONSTRAINT client_adresse_fk
FOREIGN KEY (utilisateur_id)
REFERENCES public.Client (utilisateur_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.Commande ADD CONSTRAINT panier_commande_fk
FOREIGN KEY (panier_id)
REFERENCES public.Panier (panier_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;
