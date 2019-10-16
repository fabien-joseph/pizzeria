INSERT INTO public.utilisateur (utilisateur_id, nom, prenom, numero)
VALUES ('1', 'Joseph', 'Fabien', '0678209670');

INSERT INTO public.client (utilisateur_id, nom_compte, mot_de_passe)
VALUES ('1', 'fabiendu24', 'supermdp');

INSERT INTO public.adresse (voie, code_postal, localite, utilisateur_id)
VALUES ('Avenue Ares', '33000', 'Bordeaux', '1');

INSERT INTO public.utilisateur (utilisateur_id, nom, prenom, numero)
VALUES ('2', 'Combe', 'Hugues', '0785621599');

INSERT INTO public.personnel (utilisateur_id, nom_compte, mot_de_passe, role)
VALUES ('2', 'hugguies', 'beaumotdepasse', 'pizzaiollo');

INSERT INTO public.produit (produit_id, nom, descriptif, prixunitaireht, tauxtva100, valeursnutritionnelles)
VALUES ('1',
        'Pizza napolitaine',
        'La pizza la plus populaire de notre carte !',
        '9.0',
        '11.2',
        '50g protéines, 20g glucide, etc...');

INSERT INTO public.ingredient (nom)
VALUES ('Champignons');
INSERT INTO public.ingredient (nom)
VALUES ('Jambon blanc');
INSERT INTO public.ingredient (nom)
VALUES ('Mozzarella');
INSERT INTO public.ingredient (nom)
VALUES ('Pâte');
INSERT INTO public.ingredient (nom)
VALUES ('Sauce tomate');
INSERT INTO public.ingredient (nom)
VALUES ('Tomates');

INSERT INTO public.elementstocks (nom, quantite, grandeur)
VALUES ('Champignons', '20', 'kg');

INSERT INTO public.elementstocks (nom, quantite, grandeur)
VALUES ('Jambon blanc', '20', 'kg');

INSERT INTO public.elementstocks (nom, quantite, grandeur)
VALUES ('Mozzarella', '20', 'kg');

INSERT INTO public.elementstocks (nom, quantite, grandeur)
VALUES ('Pâte', '20', 'kg');

INSERT INTO public.elementstocks (nom, quantite, grandeur)
VALUES ('Sauce tomate', '20', 'kg');

INSERT INTO public.elementstocks (nom, quantite, grandeur)
VALUES ('Tomates', '20', 'kg');

INSERT INTO public.composition (composition_id, nom, produit_id, quantite, grandeur)
VALUES ('1', 'Champignons', '1', '5', 'g');
INSERT INTO public.composition (composition_id, nom, produit_id, quantite, grandeur)
VALUES ('2', 'Jambon blanc', '1', '5', 'g');
INSERT INTO public.composition (composition_id, nom, produit_id, quantite, grandeur)
VALUES ('3', 'Mozzarella', '1', '5', 'g');
INSERT INTO public.composition (composition_id, nom, produit_id, quantite, grandeur)
VALUES ('4', 'Pâte', '1', '5', 'g');
INSERT INTO public.composition (composition_id, nom, produit_id, quantite, grandeur)
VALUES ('5', 'Sauce tomate', '1', '5', 'g');
INSERT INTO public.composition (composition_id, nom, produit_id, quantite, grandeur)
VALUES ('6', 'Tomates', '1', '5', 'g');

INSERT INTO public.panier (panier_id, produit_id, utilisateur_id)
VALUES ('1', '1', '1');

INSERT INTO public.commande (numero_commande, date, suivi, panier_id)
VALUES ('1', '2018-07-14', 'Commande enregistrée', '1');