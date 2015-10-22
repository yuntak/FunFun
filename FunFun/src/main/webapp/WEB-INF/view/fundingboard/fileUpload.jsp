<%@ page language="java" contentType="text/html; charset=EUC-KR"%>

<!-- ���� ���ε� ó���� ���� MultipartRequest ��ü�� ����Ʈ -->
<%@ page import="com.oreilly.servlet.MultipartRequest"%>

<!-- ���� �ߺ�ó�� ��ü ����Ʈ -->
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>

<%@ page import="java.util.*"%>

<%
	String uploadPath = "C:\\FunFun\\editorFiles2\\images\\";

	int size = 10 * 1024 * 1024; // ���ε� ���� �ִ� ũ�� ����

	
	String filename = "";

	try {

		// ���� ���ε�. ������ ������ ���ڰ��� ��� ����request ��ü ����,
		//���ε� ���, ���� �ִ� ũ��, �ѱ�ó��, ���� �ߺ�ó��
		MultipartRequest multi = new MultipartRequest(request, uploadPath, size, "euc-kr",
				new DefaultFileRenamePolicy());

		// ���ε��� ���ϵ��� Enumeration Ÿ������ ��ȯ
		// Enumeration���� �����͸� �̾ƿö� ������ �������̽� Enumeration��ü�� java.util ��Ű���� ���� �Ǿ������Ƿ�
		// java.util.Enumeration�� import ���Ѿ� �Ѵ�.
		Enumeration files = multi.getFileNames();

		// ���ε��� ���ϵ��� �̸��� ����
		String file = (String) files.nextElement();
		filename = multi.getFilesystemName(file);

	} catch (Exception e) {
		// ����ó��
		e.printStackTrace();
	}
%>

<html>
<body>
	���ε� �� ���ϸ� :
	<%=filename%><br>
</body>
</html>
