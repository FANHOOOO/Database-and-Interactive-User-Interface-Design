import java.sql.*; 
import java.util.Scanner;
public class database {
	public static void main(String[] args) {
		Connection conn = null; // create a connection try{
		String user = "root";
		String password = "5999";
		String dbname = "jyf1904";
		String url = "jdbc:mysql://localhost:3306/"+dbname;
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		conn = DriverManager.getConnection(url,user,password);
		Statement s = conn.createStatement();
		//MainLoop containing all the options boolean tag = true;
		Scanner input = new Scanner(System.in); // Format of options
		String menu =
			"Hello!! Please choose one option"+"\n"+
			"1. Insert a new student."+"\n"+
			"2. Delete an existing student."+"\n"+
			"3. Update the new phonenumber for a student."+"\n"+
			"4. Find all the students with DegreeCredits over 33."+"\n"+ 
			"5. Find the total number of students."+"\n"+
			"6. Quit";
		do{ 
			System.out.print(menu); 
			switch(input.nextInt()) {
				case 1:
					System.out.print("Student Number:");
					input.skip("\n");
					int num1 = input.nextInt();
					System.out.print("Phone:");
					int pho1 = input.nextInt();
					System.out.print("Student Name:");
					input.skip("\n");
 					String nam1 = input.nextLine();
 					System.out.print("Degree Credits:");
					int cred1 = input.nextInt();
					System.out.print("Major:");
					input.skip("\n");
					String maj1 = input.nextLine();
					//SQL for insertion
					String insert1 = "INSERT INTO Students VALUES("+num1 + ","+ pho1 + ",'"+ nam1 + "','"+ maj1 + "',"+ cred1 + ");";
					int n_res1 = s.executeUpdate(insert1);
					if(n_res1 == 1) // check if one row is affected.
						System.out.println("The insertion of a new student is successful.");
					break;
				case 2:
					System.out.print("Student Number:");
					int num2 = input.nextInt(); // read course number
					System.out.print("Student Name:");
					input.skip("\n");
					String nam2 = input.nextLine(); // read course location
					// SQL for deletion
					String delete2 = "DELETE FROM Students WHERE "+" StudentNumber = " + num2 + " AND Name = '"+ nam2 + "';";
					int n_res2 = s.executeUpdate(delete2);
					if(n_res2 == 1) // the input course exists and deletion is successful
						{System.out.println("The deletion of this student is successful.");}
					else // not exists, so no deletion is executed
						{System.out.println("This studnet does not exist !");}
						break;
				case 3:
					System.out.print("Student Number:");
					int num3 = input.nextInt();
					System.out.print("Student Name:");
					input.skip("\n");
					String nam3 = input.nextLine();
					String update31 = "SELECT COUNT(*) AS num FROM Students WHERE "+ "StudentNumber ="+num3 + " AND Name='"+nam3 + "';";
					s.executeQuery(update31);
					ResultSet rs31 = s.getResultSet();
					rs31.next();
					if(rs31.getInt("num")==0)
						{System.out.println("Sorry! This student doesn't exist!");break;}
					else
						{System.out.println("This student exists, please input the new phonenumber:");}
					System.out.print("Phonenumber:");
					int pho3 = input.nextInt();
					String update32 = "UPDATE Students SET " + "Phone = " + pho3 + " WHERE " + "StudentNumber =" + num3 + " AND Name = '" + nam3 + "';";
					int n_res3 = s.executeUpdate(update32);
					if(n_res3 == 1)
						{System.out.println("The update of this student phonenumber is successful.");}
					break;
				case 4:
					String query4 = "SELECT Name FROM Students WHERE " + " DegreeCredits > " + 33 + ";";
					ResultSet rs41 =s.executeQuery(query4);
					rs41.next();
					while(rs41.next())
					{
						// output the result
						System.out.println(rs41.getString("Name"));
					}
					break;
				case 5:
					String query5 = "SELECT Name FROM Students WHERE " + " Major = '"+ "EE" + "'";
					ResultSet rs51 =s.executeQuery(query5);
					rs51.next();
					while(rs51.next())
					{
						// output the result
						System.out.println(rs51.getString("Name"));
					}
					break;

				case 6:
					// exit the program
					System.out.println("GOODBYE!!!");
					tag = false;
					break;
				default: // if a wrong option is selected
					System.out.println("Please input a valid option (number 1-8) !");
			}
		}while(tag); // end of main loop
	}
	catch(Exception e)
	{
		//System.err.println("Cannot connect to database server.");
		e.printStackTrace();
	};
}
}
