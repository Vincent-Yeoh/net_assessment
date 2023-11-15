<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Assessment123._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="my-5">
    <h1>Upload CSV file (seperated by commas)</h1>
    <div class="p1 my-5">
    <asp:FileUpload CssClass="custom-file-input" ID="FileUpload" runat="server" />
    </div>
    <div>
    <asp:Button CssClass="btn btn-primary" ID="btnUpload" runat="server" text="Confirm" OnClick="btnUpload_Click" />
    <asp:Button CssClass="btn btn-danger" runat="server" Text="Clear" ID="btnClear" OnClick="btnClear_Click"/>
    </div>
    <div class="my-5">
    <asp:GridView class="table table-bordered" runat="server" ID="TxtTable" CellPadding="4" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" />
        <EditRowStyle BackColor="#2461BF" />
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F5F7FB" />
        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
        <SortedDescendingCellStyle BackColor="#E9EBEF" />
        <SortedDescendingHeaderStyle BackColor="#4870BE" />
        </asp:GridView>
        </div>
</div>

<div>
   <h1>Query Database file</h1>
    <asp:Button CssClass="btn btn-primary" ID="btnDBUpload" runat="server" Text="Result" OnClick="btnDBUpload_Click" />
     <asp:Button CssClass="btn btn-danger" ID="btnDBClear" runat="server" Text="Clear" OnClick="btnDBClear_Click" />
    <div class="my-5">
    <asp:GridView class="table table-bordered table-condensed table-responsive table-hover" runat="server" ID="EmployeeProfiles" DataSourceID="EmployeeDataSource" AutoGenerateColumns="False" AllowPaging="True" AllowSorting="True" CellPadding="4" ForeColor="#333333" GridLines="None">
         <AlternatingRowStyle BackColor="White" />
         <Columns>
        <asp:BoundField DataField="Id" HeaderText="Id" />
        <asp:BoundField DataField="Name" HeaderText="Name" />
        <asp:BoundField DataField="Age" HeaderText="Age" />
    </Columns>
         <EditRowStyle BackColor="#2461BF" />
         <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
         <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
         <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
         <RowStyle BackColor="#EFF3FB" />
         <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
         <SortedAscendingCellStyle BackColor="#F5F7FB" />
         <SortedAscendingHeaderStyle BackColor="#6D95E1" />
         <SortedDescendingCellStyle BackColor="#E9EBEF" />
         <SortedDescendingHeaderStyle BackColor="#4870BE" />
      </asp:GridView>

    <asp:GridView class="table table-bordered table-condensed table-responsive table-hover" runat="server" ID="DepartmentProfiles" DataSourceID="DepartmentDataSource" CellPadding="4" ForeColor="#333333" GridLines="None" AllowPaging="True" AllowSorting="True" >
        <AlternatingRowStyle BackColor="White" />
        <EditRowStyle BackColor="#2461BF" />
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F5F7FB" />
        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
        <SortedDescendingCellStyle BackColor="#E9EBEF" />
        <SortedDescendingHeaderStyle BackColor="#4870BE" />
        </asp:GridView>
    <asp:GridView class="table table-bordered table-condensed table-responsive table-hover" runat="server" ID="MinMaxEmployeeGrid" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False">
        <AlternatingRowStyle BackColor="White" />
        <Columns>

        <asp:BoundField DataField="Name" HeaderText="Employee Name" />
                    <asp:BoundField DataField="Designation" HeaderText="Designation" />
        <asp:BoundField DataField="Age" HeaderText="Age" />

        </Columns>
        <EditRowStyle BackColor="#2461BF" />
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F5F7FB" />
        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
        <SortedDescendingCellStyle BackColor="#E9EBEF" />
        <SortedDescendingHeaderStyle BackColor="#4870BE" />
    </asp:GridView>

    </div>
</div>

    <asp:SqlDataSource ID="EmployeeDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Employee]"></asp:SqlDataSource>

    <asp:SqlDataSource ID="DepartmentDataSource" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Department]">
    </asp:SqlDataSource>

</asp:Content>
