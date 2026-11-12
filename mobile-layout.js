/* V22: place quick links in normal mobile document flow instead of floating over content. */
(function(){
  function arrange(){
    if(!window.matchMedia('(max-width: 900px)').matches) return;
    const targets=[...document.querySelectorAll('a.excel-float, a[style*="position:fixed"][href="excel.html"]')];
    if(!targets.length) return;
    let host=document.querySelector('.mobile-quick-links');
    if(!host){
      host=document.createElement('nav');host.className='mobile-quick-links';host.setAttribute('aria-label','Hızlı erişim');
      const anchor=document.querySelector('.topbar')||document.querySelector('.education-top')||document.querySelector('.story-actions')||document.querySelector('.road-hero')||document.querySelector('.content')||document.querySelector('main');
      if(anchor)anchor.insertAdjacentElement(anchor.classList.contains('content')?'afterbegin':'afterend',host);
      else document.body.insertAdjacentElement('afterbegin',host);
    }
    targets.forEach(el=>{el.removeAttribute('style');host.appendChild(el)});
  }
  if(document.readyState==='loading')document.addEventListener('DOMContentLoaded',arrange);else arrange();
})();
