--- Get etudiants
SELECT num_et AS numInscription, nom_et AS nom, prenom_et AS prenom FROM etudiant;

--- Get modules by level & promotion name
-- SELECT id_mod AS idModule, nom_mod AS nomModule FROM modules;
SELECT DISTINCT modules.id_mod AS idModule, modules.nom_mod as nomModule
FROM cours, promotion, enseignant, modules, salles 
WHERE cours.id_promo = (SELECT id_promo FROM promotion WHERE promotion.niveau = '2' 
AND promotion.id_speci = (SELECT id_speci FROM spécialité WHERE nom_speci = 'MGL')) 
AND cours.id_promo = promotion.id_promo AND cours.id_ens = enseignant.id_ens AND cours.id_salle = salles.id_salle AND cours.id_mod = modules.id_mod 
ORDER BY cours.id_cours;