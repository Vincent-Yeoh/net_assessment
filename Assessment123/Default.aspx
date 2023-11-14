<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Assessment123._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    a.
    <asp:FileUpload ID="FileUpload" runat="server" />
    <asp:Button ID="btnUpload" runat="server" text="Confirm" OnClick="btnUpload_Click" />

    <asp:GridView runat="server" ID="TxtTable"/>
    b.
    <asp:GridView runat="server" ID="EmployeeProfiles" DataSourceID="EmployeeDataSource" />
    <br />
    <asp:GridView runat="server" ID="DepartmentProfiles" DataSourceID="DepartmentDataSource" />
    <br />
    <asp:GridView runat="server" ID="GridView1" DataSourceID="QueryDataSource" AutoGenerateColumns="False" >
        <Columns>
            <asp:BoundField DataField="Name" HeaderText="Employee Name" ReadOnly="True" SortExpression="Name" />
            <asp:BoundField DataField="Designation" HeaderText="Designation" ReadOnly="True" SortExpression="Designation" />
            <asp:BoundField DataField="Age" HeaderText="Age" ReadOnly="True" SortExpression="Age" />
        </Columns>
    </asp:GridView>

    <asp:SqlDataSource ID="DepartmentDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Department]"></asp:SqlDataSource>


    
    <asp:SqlDataSource ID="EmployeeDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Employee]"></asp:SqlDataSource>
     <asp:SqlDataSource ID="QueryDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Employee.Name, Department.Designation, Employee.Age
FROM Employee
INNER JOIN Department ON Department.Eid = Employee.Id
WHERE Employee.Age = (SELECT MAX(Employee.Age) FROM Employee)
UNION ALL
SELECT Employee.Name, Department.Designation, Employee.Age
FROM Employee
INNER JOIN Department ON Department.Eid = Employee.Id
WHERE Employee.Age = (SELECT MIN(Employee.Age) FROM Employee);"></asp:SqlDataSource>

</asp:Content>
