/* Public browser configuration; RLS enforces per-user access. */
const CLOUD_URL='https://snawwutcityclwensrcm.supabase.co';
const CLOUD_KEY='sb_publishable_H5jmlZeIoEcNvmbTZ2oUzQ_NIJ9CLxK';
const CLOUD_USERS={denelsertel:'denelsertel@sql-yolculugu.invalid',aycelen:'aycelen@sql-yolculugu.invalid'};
let cloudClient=null;
function cloud(){if(!cloudClient){if(!window.supabase?.createClient)throw Error('Supabase kütüphanesi yüklenemedi');cloudClient=window.supabase.createClient(CLOUD_URL,CLOUD_KEY,{auth:{persistSession:true,autoRefreshToken:true,detectSessionInUrl:false}})}return cloudClient}
async function cloudUser(){const {data,error}=await cloud().auth.getUser();if(error||!data.user)return null;return data.user}
async function cloudLogin(username,password){const email=CLOUD_USERS[username];if(!email)throw Error('Kullanıcı bulunamadı');const {data,error}=await cloud().auth.signInWithPassword({email,password});if(error){if(/fetch|network|failed to fetch/i.test(error.message))throw Error('Sunucuya bağlanılamadı. İnternet veya sertifika bağlantısını kontrol et.');throw Error('PIN hatalı veya giriş engellendi. Tekrar kontrol et.');}return data.user}
async function cloudLoad(kind){const user=await cloudUser();if(!user)throw Error('Oturum bulunamadı');const {data,error}=await cloud().from('learning_state').select('payload').eq('user_id',user.id).eq('kind',kind).maybeSingle();if(error)throw error;return data?.payload??null}
async function cloudSave(kind,payload){const user=await cloudUser();if(!user)throw Error('Oturum bulunamadı');const {error}=await cloud().from('learning_state').upsert({user_id:user.id,kind,payload,updated_at:new Date().toISOString()},{onConflict:'user_id,kind'});if(error)throw error}
async function cloudBoot(){if(location.pathname.endsWith('/login.html'))return;try{const user=await cloudUser();if(!user){location.replace('login.html');return}const name=user.email?.split('@')[0];if(!Object.hasOwn(CLOUD_USERS,name)){await cloud().auth.signOut();location.replace('login.html');return}localStorage.setItem('sql-active-profile',name);document.dispatchEvent(new Event('cloud-ready'));}catch(e){console.error('Cloud session:',e);document.dispatchEvent(new CustomEvent('cloud-error',{detail:e.message}))}}
window.cloud=cloud;window.cloudLoad=cloudLoad;window.cloudSave=cloudSave;window.cloudBoot=cloudBoot;
