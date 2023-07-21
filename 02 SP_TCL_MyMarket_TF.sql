# S.P borrar pagos hechos con cheques, por haber cobrado los cheques 
# Creado con comanmdos TCL recordar poner workbench con la opcion auto-commit dessctivada (Menu: query / Autocommit / desactivar) y setear el Autocommit en cero


SET AUTOCOMMIT = 0;

DELIMITER $$

CREATE PROCEDURE SP_Borrar_pagos_Cheques()
BEGIN
  DECLARE EXIT HANDLER FOR SQLEXCEPTION, SQLWARNING
  BEGIN
    -- Manejo de errores y warnings
    ROLLBACK;
    SELECT 'Error: No se pudo completar la transacción.';
  END;
  
    ROLLBACK;
  END;
 
  START TRANSACTION;
  
  -- Sentencias SQL
  DELETE FROM Pago WHERE Metodo_id = 4; 
  
  COMMIT;
  SELECT 'Cheques cobrados';
END
$$
