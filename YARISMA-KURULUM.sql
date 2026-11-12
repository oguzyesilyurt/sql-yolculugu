-- V19: iki profil arasında yalnızca ders/görev sayısını paylaşır.
-- Kişisel Excel verileri, sorgu geçmişi ve PIN'ler asla döndürülmez.
CREATE OR REPLACE FUNCTION public.sql_yolculugu_leaderboard()
RETURNS TABLE(display_name text, lessons_done integer, tasks_done integer, total_xp integer)
LANGUAGE sql STABLE SECURITY DEFINER
SET search_path = ''
AS $$
  WITH users AS (
    SELECT id, CASE email
      WHEN 'denelsertel@sql-yolculugu.invalid' THEN 'Denel'
      WHEN 'aycelen@sql-yolculugu.invalid' THEN 'Ayçelen'
    END AS display_name
    FROM auth.users
    WHERE email IN ('denelsertel@sql-yolculugu.invalid','aycelen@sql-yolculugu.invalid')
  ), points AS (
    SELECT u.display_name,
      CASE WHEN jsonb_typeof(p.payload::jsonb->'completed')='array'
        THEN jsonb_array_length(p.payload::jsonb->'completed') ELSE 0 END AS lessons_done,
      CASE WHEN jsonb_typeof(l.payload::jsonb->'solved')='array'
        THEN jsonb_array_length(l.payload::jsonb->'solved') ELSE 0 END AS tasks_done
    FROM users u
    LEFT JOIN public.learning_state p ON p.user_id=u.id AND p.kind='progress'
    LEFT JOIN public.learning_state l ON l.user_id=u.id AND l.kind='lab-v19'
  )
  SELECT display_name, lessons_done, tasks_done,
         lessons_done*20 + tasks_done*10 AS total_xp
  FROM points ORDER BY total_xp DESC, display_name;
$$;
REVOKE ALL ON FUNCTION public.sql_yolculugu_leaderboard() FROM PUBLIC;
GRANT EXECUTE ON FUNCTION public.sql_yolculugu_leaderboard() TO authenticated;
