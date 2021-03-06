package p01;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;

public class Main12 {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		System.out.println("Enter id");
		int empId = sc.nextInt();
		System.out.println("Enter name");
		String name = sc.next();
		System.out.println("Enter salary");
		float basicSalary = sc.nextFloat();
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/cdac","root","cdac");
			PreparedStatement s = con.prepareStatement("update emp set emp_name = ?, basic_salary = ? where emp_id = ?");
			s.setString(1, name);
			s.setFloat(2, basicSalary);
			s.setInt(3, empId);
			
			
			int i = s.executeUpdate();
			
			System.out.println(i+" record updated");
		}catch (ClassNotFoundException | SQLException e) {
			System.out.println(e);
		}

	}

}
