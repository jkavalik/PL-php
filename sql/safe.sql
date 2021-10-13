begin;
--
-- Test forbidden functions
--

CREATE FUNCTION test_show_source() RETURNS text
LANGUAGE plphp AS $$
	return show_source();
$$;
SELECT test_show_source();
SELECT * FROM test_show_source();

CREATE FUNCTION test_exec() RETURNS text
LANGUAGE plphp AS $$
	return exec("psql --version");
$$;
SELECT test_exec();
SELECT * FROM test_exec();


rollback;