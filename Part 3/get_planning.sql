SELECT cours.jour, 
TIME_FORMAT(cours.heure_debut, '%H:%i') AS debut, 
TIME_FORMAT(cours.heure_fin, '%H:%i') AS fin, 
enseignant.nom_ens as prof, modules.nom_mod as module, salles.nom_salle as salle
FROM cours, promotion, enseignant, modules, salles 
WHERE cours.id_promo = (SELECT id_promo FROM promotion WHERE promotion.niveau = '2' 
AND promotion.id_speci = (SELECT id_speci FROM specialite WHERE nom_speci = 'MGL')) 
AND cours.id_promo = promotion.id_promo AND cours.id_ens = enseignant.id_ens AND cours.id_salle = salles.id_salle AND cours.id_mod = modules.id_mod 
ORDER BY cours.id_cours;