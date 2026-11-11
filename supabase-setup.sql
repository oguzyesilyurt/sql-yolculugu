-- SQL Yolculuğu: Supabase SQL Editor'da bir kez çalıştır.
-- İki kullanıcı Supabase Authentication > Users içinde önceden oluşturulmuş olmalıdır.
create table if not exists public.learning_state (
  user_id uuid not null references auth.users(id) on delete cascade,
  kind text not null check (kind in ('progress','excel','daily')),
  payload jsonb not null default '{}'::jsonb,
  updated_at timestamptz not null default now(),
  primary key (user_id,kind)
);
alter table public.learning_state enable row level security;
revoke all on public.learning_state from anon;
grant select,insert,update on public.learning_state to authenticated;
drop policy if exists "Read own learning state" on public.learning_state;
create policy "Read own learning state" on public.learning_state for select to authenticated using (auth.uid()=user_id);
drop policy if exists "Insert own learning state" on public.learning_state;
create policy "Insert own learning state" on public.learning_state for insert to authenticated with check (auth.uid()=user_id);
drop policy if exists "Update own learning state" on public.learning_state;
create policy "Update own learning state" on public.learning_state for update to authenticated using (auth.uid()=user_id) with check (auth.uid()=user_id);
-- Gift messages: authenticated users only, sender is verified.
create table if not exists public.gifts (
  id uuid primary key default gen_random_uuid(),
  sender_id uuid not null references auth.users(id),
  receiver_id uuid not null references auth.users(id),
  gift_type text not null check (gift_type in ('flower','heart','star')),
  read_at timestamptz,
  created_at timestamptz not null default now(),
  check(sender_id<>receiver_id)
);
alter table public.gifts enable row level security;
revoke all on public.gifts from anon;
grant select,insert,update on public.gifts to authenticated;
drop policy if exists "Read received gifts" on public.gifts;
create policy "Read received gifts" on public.gifts for select to authenticated using (auth.uid()=receiver_id);
drop policy if exists "Send gifts" on public.gifts;
create policy "Send gifts" on public.gifts for insert to authenticated with check(auth.uid()=sender_id and sender_id<>receiver_id);
drop policy if exists "Mark own gifts read" on public.gifts;
create policy "Mark own gifts read" on public.gifts for update to authenticated using(auth.uid()=receiver_id) with check(auth.uid()=receiver_id);
