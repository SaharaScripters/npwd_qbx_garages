import{_ as g}from"./preload-helper-H-X7TzZu.js";let l,d,f,b=(async()=>{const h=new Set(["Module","__esModule","default","_export_sfc"]);let c={"./config":()=>(l([],!1,"./config"),u("./__federation_expose_Config-bJ-h_2o7.js").then(e=>Object.keys(e).every(t=>h.has(t))?()=>e.default:()=>e))},i;i={},l=(e,t,r)=>{const s=import.meta.url;if(typeof s>"u"){console.warn('The remote style takes effect only when the build.target option in the vite.config.ts file is higher than that of "es2020".');return}const _=s.substring(0,s.lastIndexOf("remoteEntry.js"));e.forEach(a=>{const n=_+a;if(!(n in i))if(i[n]=!0,t){const o="css__garage__"+r;window[o]==null&&(window[o]=[]),window[o].push(n)}else{const o=document.head.appendChild(document.createElement("link"));o.href=n,o.rel="stylesheet"}})};async function u(e){return g(()=>import(e).then(async t=>(await t.__tla,t)),__vite__mapDeps([]))}d=e=>{if(!c[e])throw new Error("Can not find remote module "+e);return c[e]()},f=e=>{globalThis.__federation_shared__=globalThis.__federation_shared__||{},Object.entries(e).forEach(([t,r])=>{const s=Object.keys(r)[0],_=Object.values(r)[0],a=_.scope||"default";globalThis.__federation_shared__[a]=globalThis.__federation_shared__[a]||{};const n=globalThis.__federation_shared__[a];(n[t]=n[t]||{})[s]=_})}})();export{b as __tla,l as dynamicLoadingCss,d as get,f as init};
function __vite__mapDeps(indexes) {
  if (!__vite__mapDeps.viteFileDeps) {
    __vite__mapDeps.viteFileDeps = []
  }
  return indexes.map((i) => __vite__mapDeps.viteFileDeps[i])
}
