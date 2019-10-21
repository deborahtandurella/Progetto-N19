package Logica;

import Database.Facade;
import Logica.Risorse.Risorsa;
import Logica.Vincoli.Vincolo;

import java.lang.reflect.Constructor;
import java.util.ArrayList;

public class BComponente {

    private Facade fdb;

    public BComponente(){
        fdb = new Facade();
    }

    public ArrayList<Componente> compByType(String type){
        ArrayList<Componente> tempC = new ArrayList<>();
        ArrayList<String[]> tempS = fdb.readComp(type);

        for(String[] s: tempS){
            tempC.add(build(s));
        }

        return tempC;
    }

    private Componente build(String[] testo){
        Componente temp = new Componente(Integer.parseInt(testo[0]),testo[1],Integer.parseInt(testo[2]),Integer.parseInt(testo[3]),Integer.parseInt(testo[4]),testo[5],testo[6]);
        addVincolo(temp);
        addRisorsa(temp);
        return temp;
    }

    private void addRisorsa(Componente c){
        ArrayList<String[]> list = fdb.readCaratteristiche(c.getId());

        for(String[] s : list){

            String nome = "Logica.Risorse.";
            nome = nome.concat(s[1]);
            Risorsa rs;

            try {
                Class[] cArg = new Class[2];
                cArg[0] = String.class;
                cArg[1] = Object.class;

                Class cl = Class.forName(nome);
                Constructor con = cl.getDeclaredConstructor(cArg);
                rs = (Risorsa) con.newInstance(s[2],s[3]);

                c.addRisorsa(rs);
            } catch (Exception e) {
                System.err.println(e);
            }

        }
    }

    private void addVincolo(Componente c){
        for(String s : c.getVincoli().split(",")){

            String nome = "Logica.Vincoli.";
            nome = nome.concat(s);
            Vincolo v;

            try {
                Class cl = Class.forName(nome);
                Constructor con = cl.getDeclaredConstructor(String.class);
                v = (Vincolo) con.newInstance(c.getName());

                c.addVincolo(v);
            } catch (Exception e) {
                System.err.println(e);
            }

        }
    }

}