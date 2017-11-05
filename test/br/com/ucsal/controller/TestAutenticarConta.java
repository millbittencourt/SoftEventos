package br.com.ucsal.controller;

import org.junit.Assert;
import org.junit.Test;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;

public class TestAutenticarConta {
	
	@Test
	public void testAutenticar() throws InterruptedException{
		
		System.setProperty("webdriver.chrome.driver", "./WebContent/WEB-INF/lib/chromedriver");
		
		WebDriver driver = new ChromeDriver();
		
		driver.get("http://localhost:8080/SoftEventos/");
		
		Thread.sleep(5000);
	
		WebElement acessoLogin = driver.findElement(By.xpath("//*[@id='conta-button']//button"));
		
		acessoLogin.click();
		
		Thread.sleep(1000);	
		
		WebElement login = driver.findElement(By.name("login"));
		
		Thread.sleep(1000);
		
		login.sendKeys("aluno");
		
		Thread.sleep(1000);	
		
		WebElement senha = driver.findElement(By.name("senha"));
		
		Thread.sleep(1000);	
		
		senha.sendKeys("aluno");
		
		Thread.sleep(1000);	
		
		WebElement entrar = driver.findElement(By.id("login-btn"));
		
		entrar.click();
		
		Thread.sleep(5000);	
		
		WebElement home = driver.findElement(By.xpath("//*[@id='conta-button']//button"));
		home.click();
		
		Assert.assertEquals("http://localhost:8080/SoftEventos/home_aluno.jsp", driver.getCurrentUrl());
			
		driver.quit();

	}

}
