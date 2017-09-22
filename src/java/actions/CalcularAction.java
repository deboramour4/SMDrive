/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package actions;

import com.opensymphony.xwork2.ActionSupport;

/**
 *
 * @author leoomoreira
 */
public class CalcularAction extends ActionSupport {
    
    private int numero;

    public int getNumero() {
        return numero;
    }

    public void setNumero(int numero) {
        this.numero = numero;
    }

    @Override
    public String execute() throws Exception {
        if (getNumero() % 2 == 0) {
            return "par";
        } else {
            return "impar";
        }
    }
    
    
    
}
