TRUNCATE TABLE 
    t_note,
    t_parametre,
    t_operateur,
    t_resolution,
    t_correcteur,
    t_candidat,
    t_matiere
RESTART IDENTITY CASCADE;



TRUNCATE TABLE 
    t_client,
    t_demande,
    t_status,
    t_demande_status,
    t_typedevis,
    t_devis,
    t_details_devis
RESTART IDENTITY CASCADE;


TRUNCATE TABLE 
  t_demande_status,
    t_demande,
    t_devis,
    t_details_devis
RESTART IDENTITY CASCADE;