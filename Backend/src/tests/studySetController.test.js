const { createStudySet, getStudySets, getStudySet, updateStudySet, deleteStudySet } = require('../controllers/studySetController');
const { supabase } = require('../utils/supabaseClient');
const { getAsync, setAsync } = require('../utils/redisClient');

// Mock Supabase and Redis
jest.mock('../utils/supabaseClient');
jest.mock('../utils/redisClient');

describe('Study Set Controller', () => {
  let mockReq;
  let mockRes;
  let mockNext;

  beforeEach(() => {
    mockReq = {
      body: {},
      params: {},
      user: { id: 'user123' }
    };
    mockRes = {
      status: jest.fn().mockReturnThis(),
      json: jest.fn()
    };
    mockNext = jest.fn();
  });

  test('createStudySet should create a new study set', async () => {
    mockReq.body = { title: 'Test Study Set', noteIds: ['note1', 'note2'] };
    supabase.from().insert().select().single.mockResolvedValue({ data: { id: 'set123', title: 'Test Study Set' } });
    supabase.from().insert.mockResolvedValue({ error: null });

    await createStudySet(mockReq, mockRes, mockNext);

    expect(mockRes.status).toHaveBeenCalledWith(201);
    expect(mockRes.json).toHaveBeenCalledWith(expect.objectContaining({
      message: 'Study set created successfully',
      studySet: expect.objectContaining({ id: 'set123', title: 'Test Study Set' })
    }));
  });

  test('getStudySets should return cached study sets if available', async () => {
    const cachedStudySets = [{ id: 'set123', title: 'Cached Study Set' }];
    getAsync.mockResolvedValue(JSON.stringify(cachedStudySets));

    await getStudySets(mockReq, mockRes, mockNext);

    expect(mockRes.status).toHaveBeenCalledWith(200);
    expect(mockRes.json).toHaveBeenCalledWith(cachedStudySets);
  });

  test('getStudySet should return a specific study set', async () => {
    mockReq.params.id = 'set123';
    const studySet = { id: 'set123', title: 'Test Study Set', notes: [] };
    supabase.from().select().eq().eq().single.mockResolvedValue({ data: studySet });

    await getStudySet(mockReq, mockRes, mockNext);

    expect(mockRes.status).toHaveBeenCalledWith(200);
    expect(mockRes.json).toHaveBeenCalledWith(studySet);
  });

  test('deleteStudySet should delete a study set', async () => {
    mockReq.params.id = 'set123';
    supabase.from().delete().eq().eq.mockResolvedValue({ error: null });

    await deleteStudySet(mockReq, mockRes, mockNext);

    expect(mockRes.status).toHaveBeenCalledWith(200);
    expect(mockRes.json).toHaveBeenCalledWith({ message: 'Study set deleted successfully' });
  });

  test('updateStudySet should update a study set', async () => {
    mockReq.params.id = 'set123';
    mockReq.body = { title: 'Updated Study Set', noteIds: ['note3', 'note4'] };
    supabase.from().update().eq().select().single.mockResolvedValue({ data: { id: 'set123', title: 'Updated Study Set' } });

    await updateStudySet(mockReq, mockRes, mockNext);

    expect(mockRes.status).toHaveBeenCalledWith(200);
    expect(mockRes.json).toHaveBeenCalledWith(expect.objectContaining({
      message: 'Study set updated successfully',
      studySet: expect.objectContaining({ id: 'set123', title: 'Updated Study Set' })
    }));
  });

  test('deleteStudySet should handle non-existent study set', async () => {
    mockReq.params.id = 'nonexistent';
    supabase.from().delete().eq().eq.mockResolvedValue({ data: null });

    await deleteStudySet(mockReq, mockRes, mockNext);

    expect(mockRes.status).toHaveBeenCalledWith(404);
    expect(mockRes.json).toHaveBeenCalledWith({ message: 'Study set not found or you do not have permission to delete it' });
  });

  // Add more tests for error cases and edge scenarios
});
